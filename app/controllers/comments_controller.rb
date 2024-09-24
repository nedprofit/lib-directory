# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_book

  def create
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @book, notice: "Комментарий был успешно добавлен."
    else
      error_message = @comment.errors.full_messages.join(", ")
      redirect_to @book, alert: "Ошибка при добавлении комментария: #{error_message}"
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :book_id)
  end
end

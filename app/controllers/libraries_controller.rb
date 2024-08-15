class LibrariesController < ApplicationController
  before_action :set_book, only: [:create]

  def create
    @library = Library.new(user: current_user, book: @book)

    if @library.save
      redirect_to @book, notice: 'Книга добавлена в вашу библиотеку.'
    else
      redirect_to @book, alert: 'Ошибка при добавлении книги в библиотеку.'
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end

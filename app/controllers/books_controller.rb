class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @comment = @book.comments.build(book_id: @book.id)
    @comments = Comment.all
    @author = @book.author(@book.author_id)
  end
  def edit
    @book = Book.find(params[:id])
  end

  def new
    @books = Book.new
  end
  def update
    @book = Book.find(params[:id])

    @book.update(rating: params[:book][:rating])

    respond_to do |format|
      format.html  # index.html.erb
      format.turbo_stream  { render :json => @posts }
    end
  end

  def characters
  end

  def staff
  end

  def screenshots
  end

  def videos
  end

  def related
  end

  def chronology
  end

  def art
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :thumbnail, :user_id)
  end
end

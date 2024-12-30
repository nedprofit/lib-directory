module AuthorsHelper
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end
end

class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def new
  end

  def create
    book = Book.create!(books_params)

    book.save

    redirect_to "/books"
  end

  def books_params
    params.permit(:name, :genre, :pages, :hardcover, :author_id)
  end

end

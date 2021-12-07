class AuthorsController < ApplicationController


  def index
    @authors = Author.all.order_by
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    author = Author.create!(authors_params)
    author.save
    redirect_to "/authors"
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(authors_params)
    redirect_to "/authors/#{author.id}"
  end

  def destroy
    author = Author.find(params[:id])
    author.destroy
    redirect_to '/authors'
  end

private
  def authors_params
    params.permit(:name, :age, :award_winning)
  end
end

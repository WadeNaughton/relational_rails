class AuthorsController < ApplicationController

  def index
    @authors = Author.all
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

  def authors_params
    params.permit(:name, :age, :award_winning)
  end
end

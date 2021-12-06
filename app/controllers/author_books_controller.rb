class AuthorBooksController < ApplicationController

  def index
    @author = Author.find(params[:author_id])
    if params[:sort]
      @books = Author.alphabetical
    else
      @books = @author.books
    end
  end
end

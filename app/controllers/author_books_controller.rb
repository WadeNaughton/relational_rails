class AuthorBooksController < ApplicationController

  def index
    @author = Author.find(params[:author_id])
    if params[:sort]
      @books = @author.alphabetical
    elsif params[:pages]
      @books = @author.page_filter(params[:pages])
    else
      @books = @author.books
    end
  end
end

class LibraryGuestsController < ApplicationController
  def index
    @library = Library.find(params[:library_id])
    # @guests = library.guests
    if params[:sort]
      @guests = Library.alphabetical
    else
      @guests = @library.guests
    end
  end
end

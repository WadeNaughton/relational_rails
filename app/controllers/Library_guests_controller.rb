class LibraryGuestsController < ApplicationController
  def index
    library = Library.find(params[:library_id])
    @guests = library.guests
  end
end

class LibraryGuestsController < ApplicationController
  def index
    @library = Library.find(params[:library_id])
    if params[:sort]
      @guests = @library.alphabetical
    elsif params[:age]
      @guests = @library.age_filter(params[:age])
    else
      @guests = @library.guests
    end
  end
end

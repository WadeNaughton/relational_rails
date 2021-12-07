class LibrariesController < ApplicationController
  def index
    @libraries = Library.all.order_by
  end

  def new
  end

  def create
    library = Library.create!(library_params)
    library.save
    redirect_to "/libraries"
  end

  def show
    @library = Library.find(params[:id])
    @library.count_guests
  end

  def library_params
    params.permit(:name, :city, :open, :max_capacity)
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update(library_params)
    redirect_to "/libraries/#{library.id}"
  end

  def destroy
    library = Library.find(params[:id])
    library.destroy
    redirect_to '/libraries'
  end
end

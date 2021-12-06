class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
  end

  def create
    guest = Guest.create!(guest_params)
    guest.save
    redirect_to "/guests"
  end


  def guest_params
    params.permit(:name, :age, :new, :library_id)
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    guest = Guest.find(params[:id])
    guest.update(guest_params)
    redirect_to "/guests/#{guest.id}"
  end

  def destroy
    guest = Guest.find(params[:id])
    guest.destroy
    redirect_to '/guests'
  end
end

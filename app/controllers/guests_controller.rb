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
end

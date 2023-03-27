class BabysittersController < ApplicationController
  before_action :set_babysitter, only: [:show, :edit, :update, :destroy]

  def index
    @babysitters = Babysitter.all
  end

  def show

  end

  def new
    @babysitter = Babysitter.new
  end

  def create
    @babysitter = Babysitter.new(babysitter_params)
    @babysitter.user = current_user
    if @babysitter.save
      redirect_to babysitters_path, notice: "You are now a babysitter!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_babysitter
    @babysitter = Babysitter.find(params[:id])
  end

  def babysitter_params
    params.require(:babysitter).permit(:first_name, :first_name,:age, :gender, :address, :cost_per_hour, :years_of_experience, :image)
  end
end

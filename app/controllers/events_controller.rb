class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    if params[:query].present?
      @events = Event.search_by_name_and_description_and_address_and_cost_and_date_and_category(params[:query])
    else
      @events = Event.all
    end
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to events_path, notice: "Your activity was posted !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "Your information was successfully updated."
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Your post  was deleted."
  end

  def upvote
    @event.upvote_by current_user

  end

  def downvote
    @event.downvote_by current_user

  end



  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :address, :cost, :category, :date, :image)
  end
end

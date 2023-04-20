class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    if params[:query].present?
      @events = Event.search_by_name_and_description_and_address_and_cost_and_date_and_category(params[:query])
    else
      @events = Event.all
    end

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { event: event }),
        marker_html: render_to_string(partial: "marker", locals: { event: event })
      }
    end
    @user_center = { lat: current_user.latitude, lng: current_user.longitude }
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
      redirect_to events_path, notice: "Your event has been posted!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "The information was successfully updated"
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "Your post  was deleted."
  end

  def upvote
    if @event.upvote_by current_user
      redirect_to profile_path(current_user.profile), notice: "This event was added to your favourites!"
    else
      render :new, status: :unprocessable_entity
    end

  end

  def downvote
    if @event.downvote_by current_user
      redirect_to profile_path(current_user.profile), notice: "You have removed this event from your list"
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :address, :cost, :category, :date, :image, :longitude, :latitude)
  end
end

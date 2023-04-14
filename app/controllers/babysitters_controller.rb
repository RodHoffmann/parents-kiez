class BabysittersController < ApplicationController
  before_action :set_babysitter, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    if params[:query].present?
      @babysitters = Babysitter.search_by_first_name_and_last_name_and_cost_per_hour_and_address_and_age_and_gender(params[:query])
    else
      @babysitters = Babysitter.all

    end

  end

  def show
    user2 = @babysitter.user
    if !Chatroom.where(user1: current_user, user2: user2).empty?
      @chatroom = Chatroom.where(user1: current_user, user2: user2)[0]
    elsif !Chatroom.where(user1: user2, user2: current_user).empty?
      @chatroom = Chatroom.where(user1: user2, user2: current_user)[0]
    else
      @chatroom = Chatroom.create(user1: current_user, user2: user2)
    end
    @review = Review.new
    @count_reviews = Review.where(babysitter_id: @babysitter.id).length
    if @count_reviews != 0
      @avarage_review = Review.where(babysitter_id: @babysitter.id).map do |review|
        review.rating
      end.reduce {|a, b| a+b } / @count_reviews
    else
      @avarage_review = 0
    end

  end

  def new
    @babysitter = Babysitter.new
  end

  def edit
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

  def update
    if @babysitter.update(babysitter_params)
      redirect_to babysitter_path(@babysitter), notice: "Your information was successfully updated."
    else
    render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @babysitter.destroy
    redirect_to babysitters_path, notice: "Your babysitter profile was deleted"
  end

  def upvote
    if @babysitter.upvote_by current_user
      redirect_to babysitters_path, notice: "This babysitter was saved successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def downvote
    if @babysitter.downvote_by current_user
      redirect_to babysitters_path, notice: "Babysitter removed from your list!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_babysitter
    @babysitter = Babysitter.find(params[:id])




      end

  def babysitter_params
    params.require(:babysitter).permit(:first_name, :last_name, :age, :gender, :address, :cost_per_hour, :years_of_experience, :image)
  end
end

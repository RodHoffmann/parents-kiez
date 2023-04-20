class BabysittersController < ApplicationController
  before_action :set_babysitter, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    if params[:query].present?
      @babysitters = Babysitter.search_by_first_name_and_last_name_and_cost_per_hour_and_address_and_age_and_gender(params[:query])
    else
      @babysitters = Babysitter.all
    end
    @babysitters_hashes_array = @babysitters.map do |babysitter|
      {
        babysitter: babysitter,
        count_reviews: count_reviews(babysitter),
        average_review: average_review(babysitter, count_reviews(babysitter)),
        city: "Berlin",
        country: "Germany"
      }
    end
  end

  def show
    @review = Review.new
    @count_reviews = count_reviews(@babysitter)
    @average_review = average_review(@babysitter, @count_reviews)
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
      redirect_to profile_path(current_user.profile), notice: "The babysitter was added to your list!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def downvote
    if @babysitter.downvote_by current_user
      redirect_to profile_path(current_user.profile), notice: "The babysitter was removed from your list!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def count_reviews(babysitter)
    Review.where(babysitter_id: babysitter.id).length
  end

  def average_review(babysitter, count_reviews)
    if count_reviews != 0
      average_review = Review.where(babysitter_id: babysitter.id).map do |review|
        review.rating
      end.reduce {|a, b| a+b } / count_reviews
    else
      average_review = 0
    end
    average_review
  end

  private

  def set_babysitter
    @babysitter = Babysitter.find(params[:id])
  end

  def babysitter_params
    params.require(:babysitter).permit(:first_name, :last_name, :age, :gender, :address, :cost_per_hour, :years_of_experience, :image, :bio)
  end
end

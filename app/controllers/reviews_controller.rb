class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create

    @review = Review.new(review_params)
    @review.user = current_user

    @review.babysitter_id = params[:babysitter].to_i

    if @review.save
      redirect_to babysitter_path(params[:babysitter])
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :babysitter_id)
  end
end

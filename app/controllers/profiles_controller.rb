class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def create
    @profile = Profile.new
    @profile.user = current_user
    @profile.save
  end

  def edit
  end

  def update
  end
end

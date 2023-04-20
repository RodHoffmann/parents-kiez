class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.where(available: true)
    if params[:query].present?
      @items = Item.search_by_name_and_description_and_age(params[:query])
    else
      @Items = Item.all
    end

    @markers = @items.map do |item|
      {
        lat: item.user.latitude,
        lng: item.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { item: item }),
        marker_html: render_to_string(partial: "marker", locals: { item: item })
      }
    end
    @user_center = { lat: current_user.latitude, lng: current_user.longitude }
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    @item.user = current_user
    @item.available = true
    if @item.save
      redirect_to items_path, notice: "Item was successfully created."
    else
      render :new
    end
  end

  def edit
    if current_user != @item.user
      redirect_to @item, notice: "You don't have permission to edit this item."
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @item.user
      @item.destroy
      redirect_to items_url, notice: "Item was successfully destroyed."
    else
      redirect_to @item, notice: "You don't have permission to delete this item."
    end
  end

  def upvote
    set_item
    if @item.upvote_by current_user
      @item.available = false
      @item.save!
      redirect_to profile_path(current_user.profile), notice: "This item was reserved successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def downvote
    set_item
    if @item.downvote_by current_user
      @item.available = true
      @item.save!
      redirect_to profile_path(current_user.profile), notice: "Item removed from your list!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :age, :image, :available)
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :share]

  def index
    @items = Item.where(available: true)
  end

  def reserve
    @item = Item.find(params[:id])
    @reservation = Reservation.new(item: @item, user: current_user, reserved_at: Time.now, expires_at: 24.hours.from_now)
    if @reservation.save
      @item.update(available: false)
      ReservationCleanupJob.set(wait: 24.hours).perform_later(@reservation.id)
      redirect_to @item, notice: 'Item was successfully reserved.'
    else
      redirect_to @item, alert: 'Failed to reserve item.'
    end
  end

  def show
    @item = Item.find(params[:id])
    if @item.available
      @reservation = Reservation.find_by(item_id: @item.id, user_id: current_user.id)
      if @reservation.nil?
        # The item is available and has not been reserved by the current user
        # Show the reservation button
      elsif @reservation.user == current_user
        # The current user has already reserved this item
        # Show a message saying that the item is already reserved
        flash[:notice] = "You have already reserved this item."
      else
        # The item has been reserved by someone else
        # Show a message saying that the item is no longer available
        flash[:alert] = "This item is currently reserved by someone else."
      end
    else
      if current_user && current_user == @item.user
        # Item is not available, but belongs to the current user
        # Show the cleanup button
      else
        # Item is not available and does not belong to the current user
        # Show a message saying that the item is no longer available
        flash[:alert] = "This item is no longer available."
      end
    end
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    @item.available = true
    if @item.save
      redirect_to @item, notice: "Item was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      render :edit
    end
  end

  def cleanup
    expired_items = Item.where("reserved_until < ?", Time.now)
    expired_items.update_all(available: true, reserved_by: nil, reserved_until: nil)
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: "Item was successfully destroyed."
  end

  def share
    @item.update(available: true)
    redirect_to @item, notice: "Item is now available for sharing."
  end

  def search
    @items = Item.where("name LIKE ?", "%#{params[:q]}%")
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :age, :house)
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy, :share]

  def index
    # @items = Item.where(available: true)
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    if @item.available
      # render the show view
    else
      redirect_to items_path, notice: 'Item not available'
    end
  end

  def new
    @item = Item.new
    # @item = current_user.items.build
  end

  # def create
  #   @item = current_user.items.build(item_params)
  #   if @item.save
  #     redirect_to @item, notice: "Item was successfully created."
  #   else
  #     render :new
  #   end
  # end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to items_path, notice: "Item was successfully created."
    else
      render :new, status: :unprocessable_entity
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

  def destroy
    @item.destroy
    redirect_to items_url, notice: "Item was successfully destroyed."
  end

  def share
    @item.update(available: true)
    redirect_to @item, notice: "Item is now available for sharing."
  end

  # def search
  #   @items = Item.where("name LIKE ?", "%#{params[:q]}%")
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :age, :house)
  end
end

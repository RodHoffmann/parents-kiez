class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.where(available: true)
    if params[:query].present?
      @items = Item.search_by_name_and_description_and_age(params[:query])
    else
      @Items = Item.all
    end
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
    if current_user == @item.user
      if @item.update(item_params)
        redirect_to @item, notice: "Item was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to @item, notice: "You don't have permission to edit this item."
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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :age, :image)
  end
end

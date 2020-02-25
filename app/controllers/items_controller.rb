class ItemsController < ApplicationController
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to action: "index"
    else
      render action: :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @category = @item.category
    @brand = @item.brand
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destory
  end

  private
  def item_params
    params.require(:item).permit(:name, images_attributes: [:picture])
  end
end
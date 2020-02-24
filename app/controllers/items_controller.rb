class ItemsController < ApplicationController
  def index
    @items = Item.all
    # @items = Item.includes(:images).order('created_at DESC')
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
      render "new"
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
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :sale, images_attributes: [:picture])
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
end
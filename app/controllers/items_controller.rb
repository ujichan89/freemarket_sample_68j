class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]

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

  def show
    @user = @item.user
    @category = @item.category
    @brand = @item.brand
    @images = @item.images
  end

  def edit
  end

  def update
    item.update(item_params)
  end

  def destroy
    item.destory
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
  
  def item_params
    params.require(:item).permit(:name, images_attributes: [:picture])
  end
end
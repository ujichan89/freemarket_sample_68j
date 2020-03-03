class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]

  def index
    @items = Item.all
    lac    = Item.group(:category_id).order('count_category_id DESC').count(:category_id).first
    category = lac[0]
    @cates = Item.where(sale: 0).where(category_id: category).first(3)
    @piccs = Image.where(item_id: @cates).distinct

    lab    = Item.group(:brand_id).order('count_brand_id DESC').count(:brand_id).first
    brand  = lab[0]
    @bras  = Item.where(sale: 0).where(brand_id: brand).first(3)
    @picbs = Image.where(item_id: @bras).distinct
  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil)
    @item.build_brand
    @item.images.new
  end
 
  def create
    @item = Item.new(item_params)
    @item.sale =  0
    if @item.save
      redirect_to root_path, notice: '出品できました'
    else
      flash.now[:alert] = 'ちゃんと書いてください'
      render :new
    end
  end  

  def show
    @user = @item.user
    @category = @item.category
    @brand = @item.brand
    @area = @item.area
    @images = @item.images
    @item = Item.find(params[:id])
  end

  def search
    if params[:l_cat]
      @m_cat = Category.find(params[:l_cat]).children
    elsif params[:m_cat]
      @s_cat = Category.find(params[:m_cat]).children
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    @parents = Category.where(ancestry: nil)
    @ctgrChild = @item.category.parent.siblings
    @ctgrGrandchild = @item.category.siblings
    @item.build_brand
  end

  def update
    @item.update(update_params)
    if @item.save
      redirect_to root_path, notice: '編集できました'
    else
      flash.now[:alert] = 'ちゃんと書いてください'
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def update_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :category_id, brand_attributes: [:id, :name], images_attributes: [:picture, :id]).merge(user_id: current_user.id)
  end
  
  def item_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :category_id, brand_attributes: [:id, :name], images_attributes: [:picture]).merge(user_id: current_user.id)
  end
end
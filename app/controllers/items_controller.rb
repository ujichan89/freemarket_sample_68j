class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :update]

  def index
    @items = Item.all
    lac    = Item.group(:category_id).order('count_category_id DESC').count(:category_id).first
    category = lac[0]
    # @cates = Item.order(created_at: :desc).where(sale: 0).where(category_id: category).first(3)
    @cates = Item.order(created_at: :desc).where(sale: 0).first(3)

    lab    = Item.group(:brand_id).order('count_brand_id DESC').count(:brand_id).first
    brand  = lab[0]
    # @bras  = Item.order(created_at: :desc).where(sale: 0).where(brand_id: brand).first(3)
    @bras  = Item.order(created_at: :desc).where(sale: 0).first(3)


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
   if @item.update(update_params)
    redirect_to item_path(@item), notice: "商品を更新しました"
   else
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
    @images = @item.images
  end

  def update_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :category_id, brand_attributes: [:id, :name], images_attributes: [:picture, :id]).merge(user_id: current_user.id)
  end
  
  def item_params
    params.require(:item).permit(:name, :price, :status, :description, :charge, :area, :day, :category_id, brand_attributes: [:id, :name], images_attributes: [:picture]).merge(user_id: current_user.id)
  end
end


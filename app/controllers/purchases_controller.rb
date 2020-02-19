class PurchasesController < ApplicationController


  def edit
    @image= Purchase.find(1)
    @item = Item.find(1)
    # @value= Item.find(1)
    # @value = Item.find([1])
  end

  # private 
  # def 
  #   params.require(:item).permit(:name)
  # end


  # def show
  #   @purchase = Image.find([1])
  # end
end


# @user = User.find_by(name: params[:name])
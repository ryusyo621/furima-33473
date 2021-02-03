class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end


  def create
    @order = Order.new(purchase_params)
    if @order.valid?
      @order.save
      redirect_to url: root_path
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:post_number, :area_id, :city, :address, :building, :phone_number)
  end


end

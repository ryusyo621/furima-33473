class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end


  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(purchase_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:post_number, :area_id, :city, :address, :building, :phone_number)
  end

  def purchase_move
    redirect_to root_path,unless current_user.id != @item.user_id
  end

end

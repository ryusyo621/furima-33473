class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :purchase_move, only: :index

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(purchase_params)
    if @order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:order).permit(:post_number, :area_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def purchase_move
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id != @item.user_id
  end
end

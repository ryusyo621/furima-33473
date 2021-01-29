class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  # def edit
  #   @item = Item.find(params[:id])
  #   unless current_user.id == @item.user_id
  #     redirect_to action: :index
  #   end
  # end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_text, :category_id, :state_id, :burden_id, :area_id, :shiping_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end

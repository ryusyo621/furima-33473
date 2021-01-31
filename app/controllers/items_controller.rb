class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :item_move, only: [:edit, :update]

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

  def show
  end

  def edit
  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:product_name, :product_text, :category_id, :state_id, :burden_id, :area_id, :shiping_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_move
    unless current_user.id == @item.user_id
      redirect_to items_path,method: :get
    end
  end
end

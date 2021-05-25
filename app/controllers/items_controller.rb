class ItemsController < ApplicationController
  before_action :authenticate_user!,    only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :not_access, only: [:edit, :update]

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
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def not_access
    redirect_to root_path unless current_user.id == @item.user_id
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :sipping_cost_id, :sipping_day_id, :prefecture_id, :category_id,
                                 :item_status_id, :image).merge(user_id: current_user.id)
  end
end

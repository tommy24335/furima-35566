class PurchaseManagementsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  
  private
  
  def purchase_address_params
    params.require(:purchase_address).permit(:address, :city, :building_name, :prefecture_id, :postal_code, :phone_number)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def move_to_root_path
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase_management.present?
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_address_params[:token], 
      currency: 'jpy'                 
    )
  end
end

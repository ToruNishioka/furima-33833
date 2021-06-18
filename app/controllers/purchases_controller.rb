class PurchasesController < ApplicationController
  before_action :sold_out_item, only: [:index]
  before_action :move_to_signed_in

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out_item
    redirect_to root_path if @item.present?
  end

  def move_to_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end
end

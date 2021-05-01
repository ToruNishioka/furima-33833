class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:title, :description, :category_id, :status_id, :delivery_charge_id, :area_id, :days_to_ship_id, :price, :user, :image).merge(user_id: current_user.id)
  end

end

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_signed_in, except: [:index, :show]
  before_action :move_to_index

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
    if @item.user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :status_id, :delivery_charge_id, :area_id,
                                 :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    if @item.user != current_user 
    redirect_to root_path 
    end
  end
end

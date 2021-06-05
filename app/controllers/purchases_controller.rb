class PurchasesController < ApplicationController
  def index
    @purchase = Purchase.new
  end

  def create
    @purchese = Purchase.new(purchese_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def parchese_params
    params.require(:order).permit(:user, :item)
  end
end
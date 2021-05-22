class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:image, :title, :description, :category_id, :status_id, :delivery_charge_id, :area_id,
                                    :days_to_ship_id, :price)
  end
end

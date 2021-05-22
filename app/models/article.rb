class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :area_id
    validates :days_to_ship_id
    validates :price
  end
end

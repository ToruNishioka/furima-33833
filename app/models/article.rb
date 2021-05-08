class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :days_to_ship

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

  validates :category_id, numericality: { other_than: 1 }
  validates :atatus_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
end

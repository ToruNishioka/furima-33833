class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to :status
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :area_id
      validates :days_to_ship_id
    end
  end
end

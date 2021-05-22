class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :category
  has_many :status
  has_many :delivery_charge
  has_many :area
  has_many :days_to_ship
  has_many :article

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :area_id
    validates :days_to_ship_id
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

class Purchase < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :item, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number

  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    
  end

  belongs_to :user
  has_one :item
  has_one :shipping_addresses
end

class ShippingAddress < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number
    validates :purchase
  end

  validates :postal_code, inclusion: {in:/\A\d{3}[-]\d{4}\z/}
  validates :phone_number, inclusion: {in:/\A[0-9]+\z/, /\A\d{11}\z/}
  

end

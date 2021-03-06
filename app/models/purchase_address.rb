class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :price, :user_id, :token

  validates :area_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :area_id
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A[0-9]\d{10,11}\z/ }
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number,
                           building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end

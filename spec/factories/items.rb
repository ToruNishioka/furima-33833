FactoryBot.define do
  factory :item do
    title              { 'test' }
    description        { 'test' }
    category_id        { 2 }
    status_id          { 2 }
    delivery_charge_id { 2 }
    area_id            { 2 }
    days_to_ship_id    { 2 }
    price              { 500 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG_8725.JPG'), filename: 'IMG_8725.JPG')
    end
  end
end

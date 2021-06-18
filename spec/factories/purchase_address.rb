FactoryBot.define do
  factory :purchase_address do
    postal_code   { '744-0071' }
    area_id       { 36 }
    city          { '下松市清瀬町' }
    house_number  { '1-5-9-301' }
    building_name { '' }
    phone_number  { '08012345678' }
    user_id       { 1 }
    item_id       { 1 }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end

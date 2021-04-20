FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '0000aa' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太朗' }
    last_name_k           { 'ヤマダ' }
    first_name_k          { 'タロウ' }
    birthday              { '1930-1-1' }
  end
end

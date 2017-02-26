FactoryGirl.define do
  factory :specialization do
    user 
    specialty 
  end
  factory :specialty do
    name "MyString"
  end
  sequence :email do |n|
    "person#{n}@example.com"
  end
  factory :user do
    email {generate :email}
    password Devise.friendly_token.first(8)  
    sca_name "Mundugus Jones"
  end
end

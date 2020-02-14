FactoryBot.define do
  factory :user do
    name { "Jay Killeen" }
    email { "me@jaykilleen.com" }
    hourly_rate { 10.00 }
    password { "password" }
    password_confirmation { "password" }
  end
end
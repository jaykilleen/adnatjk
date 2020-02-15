FactoryBot.define do
  factory :user do
    name { "Jay Killeen" }
    email { "me@jaykilleen.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
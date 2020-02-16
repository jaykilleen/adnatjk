FactoryBot.define do
  factory :shift do
    user
    organisation
    start { Time.parse("2020-01-22 09:00") }
    finish { Time.parse("2020-01-22 17:00") }
    break_length { 30 }
  end
end

FactoryBot.define do
  factory :shift do
    user
    organisation
    start { Time.parse("2020-01-22 09:00")}
    finish { Time.parse("2020-01-22 17:00") }
    break_length { 30 }

    trait :nine_to_five do
      start { Time.parse("2020-01-22 09:00") }
      finish { Time.parse("2020-01-22 17:00") }
    end

    trait :overnight do
      start { Time.parse("2020-01-22 21:00") }
      finish { Time.parse("2020-01-23 05:00") }
    end

    trait :sunday do
      start { Time.parse("2020-02-16 09:00") }
      finish { Time.parse("2020-02-16 17:00") }
    end

    trait :start_saturday_night do
      start { Time.parse("2020-02-15 21:00") }
    end

    trait :finish_sunday_morning do
      finish { Time.parse("2020-02-16 05:00") }
    end

    trait :start_sunday_night do
      start { Time.parse("2020-02-16 21:00") }
    end

    trait :finish_monday_morning do
      finish { Time.parse("2020-02-17 05:00") }
    end

    trait :long_break do
      break_length { 300 }
    end

    trait :asleep do
      break_length { 420 }
    end

    factory :nine_to_five_shift, traits: [:nine_to_five]
    factory :overnight_shift, traits: [:overnight]
    factory :sunday_shift, traits: [:sunday]
    factory :saturday_night_shift, traits: [:start_saturday_night, :finish_sunday_morning]
    factory :sunday_night_shift, traits: [:start_sunday_night, :finish_monday_morning]
    factory :sunday_night_shift_with_long_break, traits: [:start_saturday_night, :finish_sunday_morning, :long_break]
    factory :sunday_night_shift_with_a_comfy_bed, traits: [:start_saturday_night, :finish_sunday_morning, :asleep]
    factory :george_shift, traits: [:break_8_hours]

    factory :example_one do
      start { Time.parse("2020-02-16 22:00") }
      finish { Time.parse("2020-02-17 03:00") }
      break_length { 60 }
    end
  
    factory :example_two do
      start { Time.parse("2020-02-16 17:00") }
      finish { Time.parse("2020-02-17 02:00") }
      break_length { 120 }
    end
  
    factory :example_three do
      start { Time.parse("2020-02-16 21:00") }
      finish { Time.parse("2020-02-17 01:00") }
      break_length { 120 }
    end
  end
end

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    birthdate { Date.today - rand(16425).days }
    breakfast_time { Time.zone.now - rand(10).hours }
    party_time { DateTime.now + rand(10).hours }
    interview_time { DateTime.now + rand(300).hours }
  end
end

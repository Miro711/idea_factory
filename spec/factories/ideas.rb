FactoryBot.define do
  factory :idea do
    title { Faker::Quote.most_interesting_man_in_the_world }
    description { Faker::Hacker.say_something_smart }
    user
  end
end

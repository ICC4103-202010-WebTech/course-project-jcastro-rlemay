require 'securerandom'

include FactoryBot::Syntax::Methods
FactoryBot.define do
  factory :event do
    name { Faker::Esport.event }
    if Faker::Boolean
      start_date { Faker::Date.between(from: Date.today, to: Date.today + 6.months) }
      end_date { Faker::Date.between(from: start_date, to: start_date + 6.months) }

    end
    location { Faker::Address.street_address }
    description { Faker::Lorem.sentence }
    is_public { Faker::Boolean }
    event_organizer_id { EventOrganizer.offset(rand(EventOrganizer.count)).first.id }
  end
  factory :event_page do
    minimumGuests { Faker::Number.within(range: 10..50)}
    maximumGuests { Faker::Number.within(range: 50..200)}
    bannerPicture { Faker::Lorem.sentence}
    event_id { Event.offset(rand(Event.count)).first.id }
  end
  factory :invitation do
    message { Faker::Lorem.sentence}
    user_id { User.offset(rand(User.count)).first.id }
    event_id { Event.offset(rand(Event.count)).first.id }
  end
  factory :notification do
    message { Faker::Lorem.sentence}
    user_id { User.offset(rand(User.count)).first.id }
  end
  factory :poll do
    x = Event.where(:start_date => nil)
    name { x.name + " poll" }
    dates = ""

    t.text { Faker::Date}
  end
  factory :poll_notification do

  end
  factory :vote do

  end
  factory :user do

  end
  factory :user_profile do

  end
end

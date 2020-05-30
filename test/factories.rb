require 'securerandom'

include FactoryBot::Syntax::Methods
FactoryBot.define do

  factory :user do
    name { Faker::FunnyName.name }
    lastName { Faker::Name.last_name }
    password { Faker::Code.sin }
    email {Faker::Internet.safe_email}
    location {Faker::Nation.capital_city}
    address {Faker::Address.full_address}
    phone {Faker::PhoneNumber.cell_phone}
  end

  factory :event_organizer do
    user {User.offset(rand(User.count)).first}
    factory :event_organizer_with_events do
      transient do
        events_count { rand(1..5) }
        event_with_poll_count { rand(0..2) }
      end

      after(:create) do |event_organizer, evaluator|
        create_list(:event_without_poll, evaluator.events_count, event_organizer: event_organizer)
        create_list(:event_with_poll, evaluator.event_with_poll_count, event_organizer: event_organizer)
      end
    end
  end

  factory :event do

    factory :event_without_poll do
      name { Faker::Esport.event }
      start_date { Faker::Date.between(from: Date.today, to: Date.today + 6.months) }
      end_date { Faker::Date.between(from: start_date, to: start_date + 6.months) }
      location { Faker::Address.street_address }
      description { Faker::Lorem.sentence }
      is_public { Faker::Boolean.boolean }
    end
    factory :event_with_poll do
      name { Faker::Esport.event }
      location { Faker::Address.street_address }
      description { Faker::Lorem.sentence }
      is_public { Faker::Boolean.boolean }
      after(:create) do |event, evaluator|
        create_list(:poll, 1,event: event, name: event.name+" poll")
      end
    end

  end



  factory :invitation do
    message { Faker::Lorem.sentence}
    user_id { User.offset(rand(User.count)).first.id }
    event_id { Event.offset(rand(Event.count)).first.id }
  end

  factory :poll do
    minimumAnswers { Faker::Number.within(range: 5..20)}
    possibleDates { Faker::Date.in_date_period(year: 2021).to_s + " " + Faker::Date.in_date_period(year: 2021).to_s+ " " + Faker::Date.in_date_period(year: 2021).to_s}
  end

end

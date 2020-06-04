require 'securerandom'

include FactoryBot::Syntax::Methods
FactoryBot.define do

  factory :user do
    name { Faker::FunnyName.name }
    lastName { Faker::Name.last_name }
    password { Faker::Internet.password }
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
    name { Faker::Esport.event }
    location { Faker::Address.street_address }
    description { Faker::Lorem.sentence }
    is_public { Faker::Boolean.boolean }
    factory :event_without_poll do
      start_date { Faker::Date.between(from: Date.today, to: Date.today + 6.months) }
      end_date { Faker::Date.between(from: start_date, to: start_date + 6.months) }
      transient do
        invitations_count { rand(1..5) }
        comments_count { rand(2..10)}
      end

      after(:create) do |event, evaluator|
        create_list(:invitation, evaluator.invitations_count, event: event)
        create_list(:comment, evaluator.comments_count, event_page_id: event.id)
      end
    end
    factory :event_with_poll do
      transient do
        invitations_count { rand(1..5) }
        comments_count { rand(2..10)}
      end
      after(:create) do |event, evaluator|
        create_list(:poll, 1 ,event: event, name: event.name+" poll")
        create_list(:invitation, evaluator.invitations_count, event: event)
        create_list(:comment, evaluator.comments_count, event_page_id: event.id)
      end
    end
  end


  factory :invitation do
    message { Faker::Lorem.sentence }
    user { User.offset(rand(User.count)).first }
  end

  factory :poll do
    minimumAnswers { Faker::Number.within(range: 5..20) }
    possibleDates { Faker::Date.in_date_period(year: 2021).to_s + " " + Faker::Date.in_date_period(year: 2021).to_s+ " " + Faker::Date.in_date_period(year: 2021).to_s}
  end

  factory :comment do
    content { Faker::Lorem.sentence }
    user { User.offset(rand(User.count)).first }
    transient do
      replies_count {rand(0..2)}
    end
    after(:create) do |comment, evaluator|
      create_list(:comment_reply, evaluator.replies_count,comment: comment)
    end
  end

  factory :comment_reply do
    content { Faker::Lorem.sentence }
    user { User.offset(rand(User.count)).first }
  end

  factory :organization do
    name { Faker::Company.industry + " " + Faker::Company.suffix }
    transient do
      members_count {rand(0..2)}
    end
    after(:create) do |organization, evaluator|
      create_list(:organization_admin, 1, organization: organization)
      create_list(:organization_member, evaluator.members_count, organization: organization)
    end
  end

  factory :organization_admin do
    user { User.offset(rand(User.count)).first }
  end

  factory :organization_member do
    user { User.offset(rand(User.count)).first }
    after(:create) do |member, evaluator|
      if EventOrganizer.where(user_id: member.id)[0] != nil
        id_organizer = EventOrganizer.where(user_id: member.id)[0].id
        Event.where(event_organizer_id: id_organizer).each do |event|
          create(:organization_event, organization: member.organization, event: event)
        end
      end
    end
  end

  factory :organization_event do

  end

end

namespace :db do

  task :query1 => :environment do
    puts("Query 1: Get all events created by certain user.")
    result1 = Event.where("event_organizer_id" => 1)
    puts(result1)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query2 => :environment do
    puts("Query 2: Get all users belonging to an organization.")
    result2 = Organization.find(1).users
    puts(result2)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query3 => :environment do
    puts("Query 3: Get all public events in an organization.")
    result3 = Organization.find(1).events.where(public: true)
    puts(result3)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query4 => :environment do
    puts("Query 4: Get all private events in an organization.")
    result4 = Organization.find(1).events.where(public: false)
    puts(result4)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query5 => :environment do
    puts("Query 5: Get all guests that have been invited to a certain event.")
    result5 = User.joins(:invitations).where("invitations.event_id" => 1)
    puts(result5)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query6 => :environment do
    puts("Query 6: Get all guests that have voted for a date option in a certain event.")
    result6 = User.joins(:votes).where("votes.poll_id" => Poll.find_by_event_id(2))
    puts(result6)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query7 => :environment do
    puts("Query 7: Get all comments written by users on a specific event.")
    result7_1 = Comment.joins(event_page: :event).where("events.id" => 1)
    result7_2 = CommentReply.joins(comment: {event_page: :event}).where("events.id" => 1)
    puts(result7_1, result7_2)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query8 => :environment do
    puts("Query 8: Get all comments written by a specific user on all events.")
    result8_1 = Comment.joins(:user).where("users.id" => 1)
    result8_2 = CommentReply.joins(comment: :user).where("users.id" => 1)
    puts(result8_1, result8_2)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query9 => :environment do
    puts("Query 9: Get all users with administrative privileges in an organization.")
    result9 =  User.find(OrganizationAdmin.where("organization_id" => 1).ids)
    puts(result9)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

  task :query10 => :environment do
    puts("Query 10: Get all users with administrative privileges in the system. ")
    result10 = User.joins(:system_admin)
    puts(result10)
    puts("EOQ") # End Of Query -- always add this line after a query.
  end

end
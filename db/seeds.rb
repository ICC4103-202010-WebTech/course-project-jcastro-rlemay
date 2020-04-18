# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

u1 = User.create(name: "Richard", lastName: "Le May", password: "webtech",
                 email: "ralemay@miuandes.cl", location: "Edificio de Ingenieria",
                 address: "Universidad de los Andes", phone: "+56944274841")
u1.inbox_id = Inbox.find_by_user_id(u1.id).id
n1 = Notification.create(message: "Welcome to the Event Web Page",user_id: u1.id)
u1.save!
n1.save!

u2 = User.create(name: "Julio", lastName: "Castro", password: "webtech",
                 email: "jacatro2@miuandes.cl", location: "Edificio de Ingenieria",
                 address: "Universidad de los Andes", phone: "+569452746541")
u2.inbox_id = Inbox.find_by_user_id(u2.id).id
n2 = Notification.create(message: "Welcome to the Event Web Page",user_id: u2.id)
u2.save!
n2.save!

sa = SystemAdmin.create(user_id: u2.id)
sa.save!

o1 = Organization.create(name: "Organizacion")
o1.save!

o1Admin = OrganizationAdmin.create(user_id: u1.id, organization_id: o1.id)
n3 = Notification.create(message: "Thanks for creating a new organization",user_id: u1.id)
o1Admin.save!
n3.save!

o1Profile = OrganizationProfile.find_by_organization_id(o1.id)
o1Profile.description = "Massive Event"
o1Profile.bannerPicture = "PHOTO"
o1Profile.save!

u1.organization_id = o1.id
u2.organization_id = o1.id
n4 = Notification.create(message: "Welcome to the Organization",user_id: u2.id)
u1.save!
u2.save!
n4.save!

e1o = EventOrganizer.create(user_id: u1.id)
e1o.save!

e1 = Event.create(name: "Pool Party", start_date: Date.current(), end_date: Date.tomorrow(), location: "Huechuraba",
                  description: "Come to my house, and have a really fun pool party!", public: true,
                  event_organizer_id: e1o.id)
n5 = Notification.create(message: "Thanks for creating a new Event",user_id: u1.id)
e1.save!
n5.save!

e1p = EventPage.find_by_event_id(e1.id)
e1p.minimumGuests = 10
e1p.maximumGuests = 1000
e1p.bannerPicture = "Event Photo"
e1p.save!

oe1 = OrganizationEvent.create(organization_id: o1.id, event_id: e1.id)
oe1.save!

comme1 = Comment.create(content: "I think its going to be great this event", image: "Photo of him",
                        user_id: u2.id, event_page_id: e1p.id)
n6 = Notification.create(message: "You have a new comment in your event",user_id: u1.id)
comme1.save!
n6.save!

comme1rep = CommentReply.create(content: "Yeah i think the same!", image: "Photo of him happy", user_id: u1.id,
                                comment_id: comme1.id)
n7 = Notification.create(message: "You have a new reply on your comment",user_id: u2.id)
comme1rep.save!
n7.save!

#                                    NEW EVENT
e2o = EventOrganizer.create(user_id: u2.id)
e2o.save!

e2 = Event.create(name: "Birthday Party", location: "Huechuraba", description: " Its my birthday party!",
                  public: false, event_organizer_id: e2o.id)
n8 = Notification.create(message: "Thanks for creating a new Event",user_id: u2.id)
e2.save!
n8.save!

e2p = EventPage.find_by_event_id(e2.id)
e2p.minimumGuests = 5
e2p.maximumGuests = 80
e2p.bannerPicture = "Event Photo"
e2p.save!

oe2 = OrganizationEvent.create(organization_id: o1.id, event_id: e2.id)
oe2.save!

e2poll = Poll.create(name: "Birthday date", possibleDates: "2020-06-06, 2020-08-06, 2020-12-06", minimumAnswers: 5,
                     event_id: e2.id)
e2poll.save!
n11 = Notification.create(message: "A new poll has been created",user_id: u1.id)
n11.save!
e2pollnot = PollNotification.create(notification_id: n11)
e2pollnot.save!

e2pollvoteu1 = Vote.create(answerDate: Date.today(), poll_id: e2poll.id, user_id: u1.id)
e2pollvoteu1.save!

comme2 = Comment.create(content: "I think its going to be great birthday", image: "Photo of him",
                        user_id: u1.id, event_page_id: e2p.id)
n9 = Notification.create(message: "You have a new comment in your event",user_id: u2.id)
comme2.save!
n9.save!

comme2rep = CommentReply.create(content: "Yeah i think the same!", image: "Photo of him happy", user_id: u2.id,
                                comment_id: comme2.id)
n10 = Notification.create(message: "You have a new reply on your comment",user_id: u1.id)
comme2rep.save!
n10.save!






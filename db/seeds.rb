# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

u1 = User.create(name: "Richard", lastName: "Le May", password: "webtech",
                 email: "ralemay@miuandes.cl", location: "Edificio de Ingenieria",
                 address: "Universidad de los Andes", phone: "+56944274841")
n1 = Notification.create(message: "Welcome to the Event Web Page",user_id: u1.id)
u1.save!
n1.save!

u1p = UserProfile.find_by_user_id(u1.id)
u1p.userName = "rlemayd"
u1p.bio = "Student of Web tech, cursing 4th year in the University of los Andes"
u1p.save!
n12 = Notification.create(message: "Your Username and bio has been updated!",user_id: u1.id)
n12.save!

u2 = User.create(name: "Julio", lastName: "Castro", password: "webtech",
                 email: "jacatro2@miuandes.cl", location: "Edificio de Ingenieria",
                 address: "Universidad de los Andes", phone: "+569452746541")
n2 = Notification.create(message: "Welcome to the Event Web Page",user_id: u2.id)
u2.save!
n2.save!

u2p = UserProfile.find_by_user_id(u2.id)
u2p.userName = "jacastro2"
u2p.bio = "Student of Web tech, cursing 4th year in the University of los Andes"
u2p.save!
n13 = Notification.create(message: "Your Username and bio has been updated!",user_id: u2.id)
n13.save!

#                       USER 3

u3 = User.create(name: "Juan", lastName: "Ruiz", password: "webtech",
                 email: "jruiz@miuandes.cl", location: "Biblioteca",
                 address: "Universidad de Chile", phone: "+56945274841")
n20 = Notification.create(message: "Welcome to the Event Web Page",user_id: u3.id)
u3.save!
n20.save!

u3p = UserProfile.find_by_user_id(u3.id)
u3p.userName = "jruiz"
u3p.bio = "Student of Web tech, learning ruby by now"
u3p.save!
n20 = Notification.create(message: "Your Username and bio has been updated!",user_id: u3.id)
n20.save!


#                       USER 4

u4 = User.create(name: "Rodrigo", lastName: "Valenzuela", password: "webtech",
                 email: "rvalenzuela@miuandes.cl", location: "Clínica Los Andes",
                 address: "Independencia 1302", phone: "+56998274841")
n21 = Notification.create(message: "Welcome to the Event Web Page",user_id: u4.id)
u4.save!
n21.save!

u4p = UserProfile.find_by_user_id(u4.id)
u4p.userName = "rvalenz"
u4p.bio = "Born in 1998, best nominated dj in 2018"
u4p.save!
n22 = Notification.create(message: "Your Username and bio has been updated!",user_id: u4.id)
n22.save!


sa = SystemAdmin.create(user_id: u2.id)
sa.save!

o1 = Organization.create(name: "Organizacion")
o1.save!

o2 = Organization.create(name: "Organizacion 2")
o2.save!

o1Admin = OrganizationAdmin.create(user_id: u1.id, organization_id: o1.id)
n3 = Notification.create(message: "Thanks for creating a new organization",user_id: u1.id)
o1Admin.save!
n3.save!

o2Admin = OrganizationAdmin.create(user_id: u3.id, organization_id: o2.id)
n23 = Notification.create(message: "Thanks for creating a new organization",user_id: u3.id)
o2Admin.save!
n23.save!

o1Profile = OrganizationProfile.find_by_organization_id(o1.id)
o1Profile.description = "Massive Event"
o1Profile.bannerPicture = "PHOTO"
o1Profile.save!

o2Profile = OrganizationProfile.find_by_organization_id(o2.id)
o2Profile.description = "Best Organization there'll be"
o2Profile.bannerPicture = "PHOTO"
o2Profile.save!

om1 = OrganizationMember.create(user_id: u1.id,organization_id: o1.id)
om2 = OrganizationMember.create(user_id: u2.id,organization_id: o1.id)
n4 = Notification.create(message: "Welcome to the Organization",user_id: u2.id)
u1.save!
u2.save!
n4.save!
om1.save!
om2.save!

o2m1 = OrganizationMember.create(user_id: u3.id,organization_id: o2.id)
u3.save!
u4.save!
o2m1.save!


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

ie1 = Invitation.create(message: "You are invited to my house!", user_id: u2.id, event_id: e1.id)
ie1.save!

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

ie2 = Invitation.create(message: "You are invited to my birthday party!!", user_id: u1.id, event_id: e2.id)
ie2.save!

e2poll = Poll.create(name: "Birthday date", possibleDates: "2020-02-02 2020-04-04 2020-07-07", minimumAnswers: 5,
                     event_id: e2.id)
e2poll.save!
n11 = Notification.create(message: "A new poll has been created",user_id: u1.id)
n11.save!
e2pollnot = PollNotification.create(notification_id: n11.id, poll_id: e2poll.id)
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

# Third Event
e3 = Event.create(name: "Horror House Party", location: "Madrid", start_date: Date.current(),
                  end_date: Date.tomorrow(), description: " Come to get scared!",
                  public: true, event_organizer_id: e1o.id)
n14 = Notification.create(message: "Thanks for creating a new Event",user_id: u2.id)
e3.save!
n14.save!

e3p = EventPage.find_by_event_id(e3.id)
e3p.minimumGuests = 12
e3p.maximumGuests = 150
e3p.bannerPicture = "Event Photo"
e3p.save!

oe3 = OrganizationEvent.create(organization_id: o1.id, event_id: e3.id)
oe3.save!

ie3 = Invitation.create(message: "You are invited to my Scary party!!", user_id: u2.id, event_id: e3.id)
ie3.save!

comme3 = Comment.create(content: "I think its going to be a really scary birthday", image: "Photo of him",
                        user_id: u2.id, event_page_id: e3p.id)
n15 = Notification.create(message: "You have a new comment in your event",user_id: u1.id)
comme3.save!
n15.save!

comme3rep = CommentReply.create(content: "Yeah i think the same!", image: "Photo of him happy", user_id: u1.id,
                                comment_id: comme3.id)
n16 = Notification.create(message: "You have a new reply on your comment",user_id: u2.id)
comme3rep.save!
n16.save!

#Fourth Event
e4 = Event.create(name: "Water Park Party", location: "Torres del Paine", start_date: Date.current(),
                  end_date: Date.tomorrow(), description: " Come to get scared!",
                  public: false, event_organizer_id: e2o.id)
n17 = Notification.create(message: "Thanks for creating a new Event",user_id: u1.id)
e4.save!
n17.save!

e4p = EventPage.find_by_event_id(e4.id)
e4p.minimumGuests = 50
e4p.maximumGuests = 70
e4p.bannerPicture = "Event Photo"
e4p.save!

oe4 = OrganizationEvent.create(organization_id: o2.id, event_id: e4.id)
oe4.save!

ie4 = Invitation.create(message: "You are invited to my party!!", user_id: u1.id, event_id: e4.id)
ie4.save!

comme4 = Comment.create(content: "I think its going to be a really scary birthday", image: "Photo of him",
                        user_id: u1.id, event_page_id: e4p.id)
n18 = Notification.create(message: "You have a new comment in your event",user_id: u2.id)
comme4.save!
n18.save!

comme4rep = CommentReply.create(content: "Yeah!", image: "Photo of him happy", user_id: u2.id,
                                comment_id: comme4.id)
n19 = Notification.create(message: "You have a new reply on your comment",user_id: u1.id)
comme4rep.save!
n19.save!
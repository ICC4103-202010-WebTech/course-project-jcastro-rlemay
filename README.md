# Richard Le May - Julio Castro

Explain what should happen model-wise if an event is deleted and guests have already cast votes. Explain how your model layer is well-behaved in this scenario.

- In our model, if an event is deleted, then all the comments, comment replies, event organizers, event pages, invitations, organization events, polls, poll notifications and votes that have relation with our model are deleted as well, with the use of the "dependent: :destroy" statement.

Explain what should happen model-wise if an organization is deleted and events have been already created within the organization. Explain how your model layer is well-behaved in this scenario.

- Just like before, if an organization is deleted, everything that depends on this organization is going to be deleted, in our project if an organization is deleted, then the organization admins, organization events, organization profiles, event, event organizers, event pages, invitations, polls, poll notifications and votes will be deleted as well, with the use of the "dependent: :destroy" statement.

Explain what should happen model-wise if a user is deleted and the user has already created organizations, events and/or comments. Explain how your model layer is well-behaved in this scenario.

- The same than the other two answers, everything that depends on this user is going to be deleted as well. In our project, if a user is deleted, then all of his/hers comments, comment replies, events, event organizers, event pages, inboxes, invitations, notifications, organizations, organization admins, organization events, organization profiles, polsl, poll notificatiosn, system admins, user profiles and votes will be deleted if they reference this specific user, with the use of the "dependent: :destroy" statement.

# Queries

To go ahead and try the queries, you need to put in the console, this command:
- rake db:queryi , where "i" is the number of the respective query, following the course project´s document.
    i.e rake db:query1 should give you the query that gives all the events created by a certain user.

# Seeds file

In our seeds file we created:
- 2 comments
- 2 comments replies
- 2 events
- 2 event organizers
- 2 event pages
- 2 Inbox
- 2 Invitations
- 13 Notifications
- 1 Organization
- 1 Organization Admin
- 2 Organization Events
- 2 Organization Member
- 1 Organization Profile
- 1 Poll
- 1 Poll Notification
- 1 System Admin
- 2 users
- 2 user profiles
- 1 Vote

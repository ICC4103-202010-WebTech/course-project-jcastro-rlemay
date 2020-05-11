### Richard Le May - Julio Castro

# Project part 1.2

Explain what should happen model-wise if an event is deleted and guests have already cast votes. Explain how your model layer is well-behaved in this scenario.

- In our model, if an event is deleted, then all the comments, comment replies, event organizers, event pages, invitations, organization events, polls, poll notifications and votes that have relation with our model are deleted as well, with the use of the "dependent: :destroy" statement.

Explain what should happen model-wise if an organization is deleted and events have been already created within the organization. Explain how your model layer is well-behaved in this scenario.

- Just like before, if an organization is deleted, everything that depends on this organization is going to be deleted, in our project if an organization is deleted, then the organization admins, organization events, organization profiles, event, event organizers, event pages, invitations, polls, poll notifications and votes will be deleted as well, with the use of the "dependent: :destroy" statement.

Explain what should happen model-wise if a user is deleted and the user has already created organizations, events and/or comments. Explain how your model layer is well-behaved in this scenario.

- The same than the other two answers, everything that depends on this user is going to be deleted as well. In our project, if a user is deleted, then all of his/hers comments, comment replies, events, event organizers, event pages, inboxes, invitations, notifications, organizations, organization admins, organization events, organization profiles, polsl, poll notificatiosn, system admins, user profiles and votes will be deleted if they reference this specific user, with the use of the "dependent: :destroy" statement.

## Queries

To go ahead and try the queries, you need to put in the console, this command:
- rake db:queryi , where "i" is the number of the respective query, following the course project´s document.
    i.e rake db:query1 should give you the query that gives all the events created by a certain user.

## Seeds file

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

# Project part 2

## Summary of implemented features:

-  In our website, we count with:
    - Header: With the name of our website, which links to the root page (home), with a dummy search box, to be implemented, because only recieves text, also 4 buttons just like in our wireframes model, which are:
        - New Event: Links to create a new event.
        - Events: Links to a page with all the events that are created.
        - Inbox: Links to the inbox of the logged user, which contains all the notifications that he has recieved.
        - Profile: Links to the logged user profile.
        
    - Body: This changes for every page, but here's where all the content of the page is shown.
    
    - Footer: Here we putted our copyright, also some dummy links to the most common social apps, and a link to our Terms and Condition for the webpage.
    
- The home body shows, the recent events that where created, with their specifics links, and details, also a right side which shows the notification that the user has recieved recently.

- If we go to an specific event, we can see all his details, with the guests going (having a link to his user profile), and also all the comments that the event has recieved.

- If we go to an specific user, we can see his profile page, which contains all his personal info, and also 3 buttons, where 2 of them are yet not implemented, and the last one who takes us to his organization if he has, and if he doesnt have one it will take us to join an organization (not implemennted yet in the view). Also in the bottom part we can see all the events that he has created with the possibility to go to the specific event page.

- If we go to the new event button in the header, we get to a new page, asking us all the relevant information to be able to create a new event containing the name, description, date if we want or a poll if we didn´t choose the date, and also showing us a maximum of 5 random persons (We will implement all his friends here). Then in the bottom part there's a button telling us to create the event, but is not working yet.

- If we go to the events button in the header, we are taken to a page showing all the events created, with their respective information, and links if we want to see more details about it.

- If we go to the inbox button in the header, we are taken to the user's inbox, showing us all the notifications that he has recieved.

- If we go to the profile button in the header, we are taken to our profile, where we can see all our personal information, also our events created, and also a button to our organization if we have one, and if we don't, to join an organization.

- If we go to the profile's organization, we can find all the details, with a posibility to see the users, report the organization, and also see the organization creator (all not working for now), in the bottom of it, we are shown all the organization's event, with a brif description, and a link in their name to take us to the event profile. 


## Summary of features required in the assignment but pending:

- Nothing by now.

## API Tests, which should include links to your Postman collection containing tests for yourAPI:

- https://www.getpostman.com/collections/83ed881b39484168f75f

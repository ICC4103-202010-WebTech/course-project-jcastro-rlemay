### Richard Le May - Julio Castro
# Project part 3

## Summary of implemented features:
- Here we will explain how to get to all the specific points in the project assignment:
    1) System Adminstration.<br/>
        1.1. Perform CRUD operations on Organizations.<br/>
            - This can only be done by the administrator, so, the only way you can get to the administrator is by writing yourself in the url: "http://127.0.0.1:3000/admin", and you will be taken to the main view of the admin, and there you have to select "Manage Organizations", here you will be taken to all the organizations that are created and in the top right corner of the body, there's an Plus Button, where you can create an organization.<br/>
            - To edit an organization, you have to click in a specific organization, and in the right of the body there's a button called "Edit Organization", where it'll take you to edit this specific organization.<br/>
            - The read part, i don't think i need to explain how to get there, because when you pressed the name of an organization, you were shown the Organization, with all his specific attributes.<br/>
            - To delete an organization, you can do it in 2 different parts, in the page where all the organizations where (just clicking the trash icon will get you to delete it) or in the organization itself where in the top right of the body is a trash button to delete it.<br/><br/>
        1.2 Perform CRUD operations on Events.<br/>
            - This can only be done just like with the organizations CRUD, but the only difference is that everyone can create an event, so if you want to create one you can do it being an admin (and writing the specific path), or just clicking in the navbar the "New Event" button.
                - To create an event you have two options, specify the date you want for the event, or have the option to create a poll, where you have to set the possible dates in this format "DD-MM-YYYY" and with a space between the dates, just like this, "DD-MM-YYYY DD-MM-YYYY"<br/>
            - To edit an event, you can only do it with admin privilegies, so you have to write the same url given in the 1.1.1 section, and in here you can edit, read and delete events the same way than with organizations, but the difference is that here you have to press the "Manage Events button.<br/>
            - The read of the events, organizations and comments also can be achieved just by being a user with no special privilegies.<br/><br/>
        1.3 Perform CRUD operations on Event comments.<br/>
            - To read events you need to go to the event page of any event, and there you can see all the comments that the event has, also here you can create a comment, just by writing in the "write a comment" section, and when you are done, you just press the send button.<br/>
            - To edit a comment or delete one, you have to have administrator privileges, so just like in comments and organization, you have to go into the url specified in the 1.1.1 section, and then go to the "Manage Events button", select the event you want to see the comments, and then you'll have 2 options in a specific comment, the pencil button, which allows you to edit the comment, and the trash button which allows you to delete the comment with all his replies.<br/><br/>
    2) User Profile.<br/>
        2.1 View user profile.<br/>
            - To see the user profile you just have to click in the navbar button called "profile", and there you can see the user with all his attributes.<br/>
        2.2 The edit user, for now is public, so for now anyone who wants can edit a user, we left it like that because we were thinking in the future, and the a user obviously should be able to edit his own user, so, it's better for now to leave it this way.<br/>
        2.3 In the same profile you can see the events you were invited and your created events (2.4).<br/><br/>
    3) Organization.<br/>
        - You can go to the organization by going to a user profile and in the right you'll have a button which says "View Organization" or "Join a Organization", if it's the first one, it'll take you to the organization profile, and if it's the second possible button, it'll take you to a list of all the organizations there are, and you can press an specific one and see his profile (for now the join a organization is not joining anyone to an organization).<br/>
        - Anyone can manage an organization page, just by clicking the "edit organization" button you can edit all of its attributes.<br/>
        - The profile of the organization shows its public events in the bottom part of the body.<br/><br/>
    4) Events.<br/>
        4.1 View events.<br/>
            - 4.1.1. In the event profile, which you can get by pressing the name of an event, ypu can see all his attributes, incluiding his title, description, lcoation, and creation date.<br/>
            - 4.1.2. In the event page in the right of the body, there's a button called "View Event Pictures", which takes you to all the pictures that the event has, and also gives you the possibility to add more pictures if you want.<br/>
            - 4.1.3. In the event page in the right of the body, there's a button called "View Event Files", which takes you to all the files that the event has, and also gives you the possibility to add more files if you want, we only accept pdf files, because we think is the most common file in events.<br/>
            - 4.1.4. In the event page in the right of the body, there's a button called "View Event Videos", which takes you to all the videos that the event has, and also gives you the possibility to add more videos if you want.<br/>
        4.2 Start event vote.<br/>
            - This was explained before, but you can create the event and gives you the option to create a poll by clicking the radio button.<br/>
        4.3 Configure event date vote.<br/>
            - To configure the event date vote, is just after clicking the radio button, where you can configure all the possible dates, and then finally create the poll by clicking the "Create Event" button.<br/>
        4.4 Vote for event date.<br/>
            - You can vote for an event date in the events that shows you that there's a poll available (a button that says "poll"), you can only vote once in every event, so don't try to vote again, because you'll not be able.<br/>
        4.5 Invite guests.<br/>
            - To invite guest, you have to go to the event profile, and go to the "Invited Users section" and press the "+" button and it'll take you to a list of all the users there are and you can invite anyone you want, and after inviting him he'll be erased from that list, so you can't invite someone who's already invited.<br/>
        4.6 Delete event.<br/>
            - This and the 4.7 section where explained in the 1.2 section.<br/>
        4.8 Add comment.<br/>
            - This was explained in the 1.3 section.<br/>
        4.9 View comments.<br/>
            - As said before, you can see all the comments that an event has in the events page.<br/><br/>
    5) Search.<br/>
        - All this points will be resumed, because you can get them all the same way.
            - In the navbar there's a search form where you can search anything requested in the section 5, and when you press the "search" button you'll be taken to a new page with all of the results.<br/>
            - This results can filtered, with the "search by" label, where you choose the results you want to get. <br/>



            

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

- If we go to an specific user, we can see his profile page, which contains all his personal info, and also 3 buttons, where 1 of them is yet not implemented, the first button is the one that doesn't do anythin, where we'll implement an option to edit the profile, the second button, takes us to see all his friends (but for now only shows all the users created), and the last one takes us to his organization if he has, and if he doesn't have one it takes us to join an organization (shows us all the organizations there are). Also in the bottom part we can see all the events that he has created with the possibility to go to the specific event page.

- If we go to the new event button in the header, we get to a new page, asking us all the relevant information to be able to create a new event containing the name, description, date if we want or a poll if we didn´t choose the date, and also showing us a maximum of 5 random persons (We will implement all his friends here). Then in the bottom part there's a button telling us to create the event, but for now it doesn't do anything.

- If we go to the events button in the header, we are taken to a page showing all the events created, with their respective information, and links if we want to see more details about it.

- If we go to the inbox button in the header, we are taken to the user's inbox, showing us all the notifications that he has recieved.

- If we go to the profile button in the header, we are taken to our profile, where we can see all our personal information, also our events created, and also a button to our organization if we have one, and if we don't, to join an organization.

- If we go to the profile's organization, we can find all the details, with a posibility to see the users, report the organization, and also see the organization creator (the report button is not doing anything yet), in the bottom of it, we are shown all the organization's event, with a brif description, and a link in their name to take us to the event profile. 


## Summary of features required in the assignment but pending:

- Nothing.

## API Tests, which should include links to your Postman collection containing tests for yourAPI:

- https://www.getpostman.com/collections/83ed881b39484168f75f



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

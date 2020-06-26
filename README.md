### Richard Le May - Julio Castro
# Project part 4

## Database setup:
- To set up our database, you only need to execute the task: ```rake db:set```. This task not only automatically resets and migrates the database, but also generates an array of events, users, organizations, invitations and all necessary objects for our database via our seeds and our factories functions.
- You can also modify the number of objects to create. by default we have 30 users, 10 events and 3 organizations, each with their respective dependencies and objects(comments, invitations, members and such).
- All users created by default have the password "webtech"
- We created one Admin by default, with credentials: "eventerltda@gmail.com" and password "webtech".
    
## Summary of implemented features:
- Here we will explain how to get to all the specific points in the project assignment:
    1) System Access
        - 1.1. Log in with email address.
            - This can be done by anyone clicking the link to login where you are requested to put your already created user email with your password.
        - 1.2. Log in with Google authentication.
            - This can be done by anyone except the admins, because we think that is better if the users can only access with the email registered in the app.
            - To do this, you need to go to the login button, and then click "Sign in with Google", where it'll take you to choose to google if you don't have your account settled.
        - 1.3. Log out.
            - This can only be done when you are logged in (obviously) and there are different paths to do this if you are logged as an admin or as a normal user.
            - If you are an admin, there's a button in the navbar, that says sign out, which takes you to log out.
            - If you are a normal user, you have to go to the user button in the navbar and then click sign out.
    2) Registration
        - 2.1. User registration.
            - To register you can do it in two different ways if you want to register as a normal user or as an admin.
            - If you want to register as an admin, you have to go to the Log as admin button in the navbar, and then go to sign up, where you can be registered as an admin (this was implemented because of
            the feedback given for the assignment part 3, asking for a button to take us to the logging part as an admin).
            - If you want to register as a normal user, you have to go to the registration button in the navbar or with the sign in button and then the sign up button.
        - 2.2. Change password.
            - To change your password if you're logged in, you have to go to your profile and then click the "Manage your account" button, which takes you to a view asking for your new password.
        - 2.3. Password recovery.
            - To recover your password you have to go to the login view, and then click the button "Forgot your password?", which takes you to a new view asking your email, and then you have to follow the steps sent to the email you gave (because we are using a local host, you have to see the link given in the same machine you are running the program, because the link will need the local provider).
    3) User Administration.
        - 3.1. New user.
            - This was explained in the point 2.1
        - 3.2. View user details.
            - To see your user details you just have to click in the navbar button called "User", then the "Your profile" button, and there you can see the user with all his attributes.
            - If you want to see another user details, you have to click in the "Users" button in the navbar, which takes you to all the user that are registered.
            - 3.2.1. Last access.
                - The last access can be seen in the users profile, which has an attribute called "last access", showing his last access if he has accessed the page and if he haven't, he will have an empty field there.
            - 3.2.2. User role.
                - # FALTA POR HACEEEEEEEEEEEEEEEEEEEEEEER!!!!!!!!!!!!!!!!!!!!!!!
        - 3.3. Edit User.
            - The users can be edited by the admins or by the own user, going to the "User" button in the navbar and then to the "Your profile" button, which takes you to your profile and there you have a button called "Edit Profile", which lets you edit your profile.
            - If you are an admin, you can get to the user by going in the navbar to the "Users" button or also with the "Organizations" button, then select one, an there's a button called "view users", which takes you to all users, and then you select the one you want to edit, taking you to his profile and then you have to select the "edit user" button to edit him.
            - 3.3.1. Change password.
                - This part was explained in the point 2.2.
        - 3.4. Delete user.
            - You can delete a user if you are logged with the user you want to delete or if you are an admin.
            - If you want to delete your user you can go to the "User" button in the navbar, then to the "Your profile" taking you to your profile and then you have to go to the "Manage your account" button, and there you can click "Cancel my account" button.
            - If you are an admin, you can get to the user by going in the navbar to the "Users" button or also with the "Organizations" button, then select one, an there's a button called "view users", which takes you to all users, and with a trash icon in the right part of the user, making you able to delete them, or you can do it the same way that a user can delete his account.
    4) System Administration.
        - 4.1. Perform CRUD operations on Users.
            - 4.1.1. Create User.
                - To create a user, you just have to do sign up just like how i explained in the point 2.1.
            - 4.1.2. View User details.
                - To view a specific user details, you just have to do what i explained in the point 3.2.
            - 4.1.3. Update User.
                - To update a user, you just have to do what i explained in the point 3.3.
            - 4.1.4. Delete User.
                - To delete a user, you just have to do what i explained in the point 3.4.
        - 4.2. Perform CRUD operations on Organizations.
            - 4.2.1. Create Organization.
                - To create an organization, only the normal users can do this, and to do it you just have to go to the "Organizations" button in the navbar, and then by clicking the "New Organization" button, which allows you to create an organization. Also you can create one by going instead of "New Organization" to "All Organizations" and there's a plus button taking you to create a new organization.
            - 4.2.2. View Organization details.
                - To view a specific organization detail, you just have to press the name of an organization in the All Organizations part ("Organizations" => "All Organizations" buttons in the navbar), and you'll be taken to the profile of that organization with all his specific attributes.
            - 4.2.3. Update Organization.
                - To update an organization, you have to click in a specific organization, and in the right of the body there's a button called "Edit Organization", where it'll take you to edit this specific organization. This can only be done by admins or by the organization creator.
            - 4.2.4. Delete Organization.
                - To delete an organization, you can do it in 2 different parts, in the page where all the organizations are (just clicking the trash icon will get you to delete it) or in the organization itself where in the top right of the body is a trash button to delete it. This can only be done by an admin, or by an organization admin to his specific organization.
        - 4.3. Perform CRUD operations on Events.
            - 4.3.1. Create Events.
                - To create an event, only the normal users can do this, and to do it you just have to go to the "Events" button in the navbar, and then by clicking the "New Event" button, which allows you to create an event. Also you can create one by going instead of "New Event" to "Public Events" and there's a plus button taking you to create a new event.
            - 4.3.2. View Events details.
                - To view a specific event detail, you just have to press the name of an event in the Public Events part ("Events" => "Public Events" buttons in the navbar), and you'll be taken to the profile of that event with all his specific attributes.
            - 4.3.3. Update Events.
                - To update an event, you have to click in a specific event, and in the right of the body there's a button called "Edit Event", where it'll take you to edit this specific event. This can only be done by admins, by the event creator or if the creator has an organization, by the specific organization creator.
            - 4.3.4. Delete Events.
                - To delete an event, you can do it in 2 different parts, in the page where all the event are (just clicking the trash icon will get you to delete it) or in the event itself where in the top right of the body is a trash button to delete it. This can only be done by admins, by the event creator or if the creator has an organization, by the specific organization creator.
        - 4.4. Perform CRUD operations on Event comments.
            - 4.4.1. Create Event comments.
                - To create an event comment, only the normal users can do this, and to do it you just have to go to the "Events" button in the navbar, and then click the "Public Events" button, which allows you to view all events, and there you choose one event and if you go down you can see the comments that the event has, and there you have an option to create one. Also you can create one if you go to any event from the home page or from any part that you can get to an event, and do the same we said before. This can only be created in public events or in private but if you are invited to or you created it.
            - 4.4.2. View Event comments.
                - To read a specific event comments, you just have to go to the "Events" button in the navbar, and then click the "Public Events" button, which allows you to view all events, and there you choose one event and if you go down you can see the comments that the event has. That's not the only way to get to the events, you can get from the organization, the home page, etc, but for all is the same steps to view the comments.
            - 4.4.3. Update Event comments.
                - To update an event comment, just like said in the previous 2 points, you have to go and see the comments from an event and if you are the creator of the comment, the creator of that event or an admin, you can edit the comment by clicking the pen icon in the right part of the comment you want to edit.
            - 4.4.4. Delete Event comments.
                - To delete an event comment, just like said in the previous 2 points, you have to go and see the comments from an event and if you are the creator of the comment, the creator of that event or an admin, you can delete the comment by clicking the trash icon in the right part of the comment you want to delete.
    5) User Profile.
        - 5.1. View user profile.
            - This was explained in the point 3.2.
        - 5.2. Edit user profile.
            - This was explained in the point 3.3.
        - 5.3. View events to which the user has been invited.
            - To see them, you just have to go to your user profile by clicking "User" button in the navbar and then "Your Profile", when you get there you have to scroll down and you get to the section called "Events you were invited to" showing you a list with all the events you've been invited.
        - 5.4. View created events.
            To see them, is just like in 5.3, but instead of scrolling down to the events you were invited you have to go to the "Your created events" section.
    6) Organization.
        - 6.1. View organization page.
            - This was explained in the point 4.2.2
        - 6.2. Manage organization page.
            - This was explained in the point 4.2.3
        - 6.3. See public events.
            - To see them  you just have to get to an organization and click in the name to be taken to that organization profile, and then you have to scroll down until you get to the section "This Organization's Public Events", which shows you all the public events that this organization has.
    7) Mailbox.
        - 7.1. See inbox.
            - Only the users have inboxes, and they can see them by clicking the "User" button in the navbar and then the "Inbox" button.
        - 7.2. View incoming message.
            - In the same part that we show his inbox we can see all our incoming messages.
        - 7.3. Compose message to user.
            - If you want to compose a message to a user, you have to get to the user's profile and then click in the "Send Message" button, allowing you to send one.
    8) Events.
        - 8.1. View event
            - You can see the event by going to the event profile page, and there you can get to the photos, details, files, and videos by clicking in the respective button.
        - 8.2. Start event date vote.
            - When we create an event (explained in the point 4.3.1), you can choose by setting right away the date for the event, or by making a poll, giving all the possible dates you want, minimum answers and a name, and that's how you start an event date vote.
        - 8.3. Configure event date vote.
            - # FALTA POR HACEEEEEEEEEEEEEEEEEEEEEEER!!!!!!!!!!!!!!!!!!!!!!!
        - 8.4. Vote for event date.
            - You can vote for the date of an event if the creator set the poll, and if it's public, or is private, but you were invited to it. To do this you just have to get to the event, and click the poll link and it'll take you to the specific event poll.
        - 8.5. Invite guests.
            -  To invite guest, you have to go to the event profile, and go to the "Invited Users section" and press the "+" button and it'll take you to a list of all the users there are and you can invite anyone you want, and after inviting him he'll be erased from that list, so you can't invite someone who's already invited. This can only be done by the event creator or by an admin.
            - Also if you regret inviting someone, you can uninvite them by clicking in the invited users the trash button. Also this can only be done by the event creator or by an admin.
        - 8.6. Delete event.
            - This was explained in the point 4.3.4.
        - 8.7. Edit event.
            - This was explained in the point 4.3.3.
        - 8.8. Add comment.
            - This was explained in the point 4.4.1.
        - 8.9. View comments.
            - This was explained in the point 4.4.2.
        - 8.10. Report event as inappropriate.
            - If you go to an event page, you have the option ot report it, by clicking the button "Report Event", and you can give the reason why you're reporting it.
            - This reports will get to all the admins, and they'll know what to do with them.
    9) Acceptable Use Policy (AUP) and Terms of Service (ToS).
        - 9.1. Provide AUP and ToS documents.
            - You can get to this section in every page by going to the footer, and clicking the "AuP and ToS" button, taking you to see them, and you can expand them if you want to read all of it.
        - 9.2. Report abusive content.
            - You can report abusive contents by going to the user who's abusive and clicking the report button, the same to an organization, or to an event.
            - This reports will get to all the admins, and they'll know what to do with them.
    10) Search.
        - All this points will be resumed, because you can get them all the same way.
            - In the navbar there's a search form where you can search anything, and when you press the "search" button you'll be taken to a new page with all of the results.
            - This results can filtered, with the "search by" label, where you choose the results you want to get.



# Project part 3
## Summary of implemented features:
- Here we will explain how to get to all the specific points asked in the project assignment:
    1) System Adminstration:<br/>
        - 1.1. Perform CRUD operations on Organizations.<br/>
            - This can only be done by the administrator, so, the only way you can get to the administrator is by writing yourself in the url: "http://127.0.0.1:3000/admin". with this link, you will be taken to the main view of the admin where you'll see the options to manage organizations., 
            - for creating an event, you'll need to go to the "http://127.0.0.1:3000/admin/organizations" path, either by pressing the button on main admin page, or putting the raw link in your browser. This will redirect you to the index of all the organizations that exist. In the top right corner of the body, there's an Plus Button, where you can create an organization.<br/>
            - To edit an organization, you have to click in a specific organization, and in the right of the body there's a button called "Edit Organization", where it'll take you to edit this specific organization.<br/>
            - for reading, just click on the name of an organization in the index of them. you can also acces to them as a user trough your profile if you have one, or if the user doesnt have one, you can access to all the organizations<br/>
            - To delete an organization, you can do it in 2 different parts, in the page where all the organizations where (just clicking the trash icon will get you to delete it) or in the organization itself where in the top right of the body is a trash button to delete it.<br/><br/>
        - 1.2 Perform CRUD operations on Events.<br/>
            - This, just like in the 1.1 section, can only be done by the admin, the only difference is that everyone can create and edit their own events, so if you want to create one you can do it by being an admin, or just clicking in the navbar the "New Event" button.
                - To create an event you have two options, specify the date you want for the event, or have the option to create a poll, where you have to set the possible dates in this format "DD-MM-YYYY DD-MM-YYYY DD-MM-YYYY ...". For example "11-12-2021 05-08-2020"<br/>
            - To edit an event you just need to go to the page of any given event and press the 'edit event button'.
            - To delete an event, you can only do it with admin privilegies in the manage events section. In here you can edit, read and delete events the same way than with organizations.<br/>
            - The read of the events, organizations and comments also can be achieved just by being a user with no special privilegies.<br/><br/>
        - 1.3 Perform CRUD operations on Event comments.<br/>
            - To read events comments, you need to go to the event page of any event, there you can see all the comments that the event has.
            - To create a comment, you just need to be on any event page and write and submit your comment in the comment box.<br/>
            - To edit a comment or delete one, you need to have administrator privileges inside an event page. so just like in comments and organization, you'll have to go into the url specified in the 1.1.1 section, and then go to the "Manage Events button", select the event you want to see the comments, and then you'll have 2 options in a specific comment, the pencil button, which allows you to edit the comment, and the trash button which allows you to delete the comment with all his replies.<br/><br/>
    2) User Profile:<br/>
        - 2.1 View user profile.<br/>
            - To see the user profile you just have to click in the navbar button called "profile", and there you can see the first user with all his attributes.<br/>
            - One can also click on any user name in the site and see their profile.
        - 2.2 The edit user, for now is public, so anybody can edit any user profile.<br/>
        - 2.3 In the same profile you can see the events you were invited and your created events (2.4).<br/><br/>
    3) Organization:<br/>
        - You can go to the organization by going to a user profile and in the right you'll have a button which says "View Organization" or "Join a Organization", if it's the first one, it'll take you to the organization profile, and if it's the second possible button, it'll take you to a list of all the organizations there are, and you can press an specific one and see his profile (for now the join a organization is not joining anyone to an organization).<br/>
        - Anyone can manage an organization page, just by clicking the "edit organization" button you can edit all of its attributes.<br/>
        - The profile of the organization shows its public events in the bottom part of the body.<br/><br/>
    4) Events:<br/>
        - 4.1 View events:<br/>
            - 4.1.1. In the event profile, which you can get by pressing the name of an event, ypu can see all his attributes, incluiding his title, description, lcoation, and creation date.<br/>
            - 4.1.2. In the event page in the right of the body, there's a button called "View Event Pictures", which takes you to all the pictures that the event has, and also gives you the possibility to add more pictures if you want.<br/>
            - 4.1.3. In the event page in the right of the body, there's a button called "View Event Files", which takes you to all the files that the event has, and also gives you the possibility to add more files if you want, we only accept pdf files, because we think is the most common file in events.<br/>
            - 4.1.4. In the event page in the right of the body, there's a button called "View Event Videos", which takes you to all the videos that the event has, and also gives you the possibility to add more videos if you want.<br/>
        - 4.2 Start event vote:<br/>
            - This was explained in the 1.2 section, but when creating an event, one can select the option to use a poll instead of a fixed date, here you can specify and start the poll for users to vote into.<br/>
        - 4.3 Configure event date vote:<br/>
            - This was explained in the 1.2 section, but to configure the event date vote, one needs to select the poll option in the event creation page, there you can configure the number of dates to choose from by following the format specified in 1.2.<br/>
        - 4.4 Vote for event date:<br/>
            - You can vote for an event date specified in a poll in the 'poll' button that appears on any event that has a poll instead of an specific date, you can only vote once in every event, so don't try to vote again, because you'll not be able to.<br/>
        - 4.5 Invite guests:<br/>
            - To invite guest, you have to go to the event page of any event, and go to the "Invited Users section" and press the "+" button. This will take you to a list of all  users, where you can invite anyone you want, and after inviting him he'll be erased from that list, so you can't invite someone who's already invited.<br/>
        - 4.6 Delete event:<br/>
            - This and the 4.7 section where explained in the 1.2 section.<br/>
        - 4.8 Add comment:<br/>
            - This was explained in the 1.3 section.<br/>
        - 4.9 View comments:<br/>
            - As said before, you can see all the comments that an event has by being in the proper event page.<br/><br/>
    5) Search:<br/>
        - All this points will be resumed, because you can get them all the same way.
            - In the navbar there's a search form where you can search anything requested in the section 5, and when you press the "search" button you'll be taken to a new page with all of the results at the same time(we only show 5 per category, so the page is not cluttered with info).<br/>
            - After doing a query, you can do an advanced search in the search page by choosing a filter.<br/>

## Database setup:
- to set up our database, you only need to execute the task: ```rake db:set```. This task not only automatically resets and migrates the database, but also generates an array of events, users, organizations, invitations and all necessary objects for our database via our seeds and our factories functions.
- you can check our factories.rb file to have a glimpse of how we create the database objects.
- you can also modify the number of objects to create. by default we have 30 users, 10 events and 3 organizations, each with their respective dependencies and objects(comments, invitations, members and such).
    

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

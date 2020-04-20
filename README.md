# Richard Le May - Julio Castro

Explain what should happen model-wise if an event is deleted and guests have already cast votes. Explain how your model layer is well-behaved in this scenario.

- In our model, if an event is deleted, in the comment, comment reply, event_organizer, event_page, invitation, organization_event, poll, poll_notification and vote models, where everyone that mentions this specific event, is going to be deleted with it, because they can´t exist without him.

Explain what should happen model-wise if an organization is deleted and events have been already created within the organization. Explain how your model layer is well-behaved in this scenario.

- As before, the idea it´s the same, if an organization is deleted, everything that depends on this organization is going to be deleted, in our project if an organization is deleted, then the organization_admin, organization_event, organization_profile, event, event_organizer, event_page, invitation, poll, poll_notification and vote will be deleted as well.

Explain what should happen model-wise if a user is deleted and the user has already created organizations, events and/or comments. Explain how your model layer is well-behaved in this scenario.

- The same than the other two answers, everything that depends on this user is going to be deleted as well. In our project, if an user is deleted, then, comment, comment_reply, event, event_organizer, event_page, inbox, invitation, notification, organization, organization_admin, organization_event, organization_profile, poll, poll_notification, system_admin, user_profile adn vote will be deleted if they reference this specific user.

All of this was done making the specific relation with the event in a cascade mode, making them all dependent with the specific model.

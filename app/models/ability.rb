# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.class.name == "User"
        can :read, User
        can :manage, User, id: user.id

        can [:read,:files,:photos,:videos], Event, is_public: true
        can [:read,:files,:photos,:videos], Event do |event|
          Invitation.where(event_id: event.id).pluck(:user_id).include? user.id
        end
        can :new, Event
        can :create, Event
        can :manage, Event do |event|
          if event.organization != nil and event.event_organizer != nil
            event.event_organizer.user_id == user.id or event.organization.organization_admins.pluck(:user_id).include? user.id
          elsif event.event_organizer != nil
            event.event_organizer.user_id == user.id
          end
        end

        can :read, Organization
        can :new, Organization
        can :create, Organization
        can :manage, Organization do |organization|
          OrganizationAdmin.where(:organization_id => organization.id).
              pluck(:user_id).include? user.id
        end

        can :read, Comment
        can :create, Comment
        can [:update,:destroy], Comment do |comment1|
          if comment1.event.organization!= nil
            comment1.event.organization.organization_admins.pluck(:user_id).include? user.id
          end
        end
        can :manage, Comment do |comment|
          comment.user_id == user.id or comment.event.event_organizer.user_id == user.id
        end

        can :read, Message, to_id: user.id
        can :create, Message

        can :read, Inbox, user_id: user.id

        can :manage, Poll do |poll|
          poll.event.event_organizer.user_id == user.id
        end
        can [:read,:update], Poll do |poll|
          Invitation.where(event_id: poll.event_id).pluck(:user_id).include? user.id or
              poll.event.is_public
        end
      elsif user.class.name == "SystemAdmin"
        can :manage, :all
        cannot :create, Event
        cannot :create, Organization
        cannot :create, Comment
        cannot :update, Poll
      end
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

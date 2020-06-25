# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      if user.class.name == "User"
        can :read, User
        can :manage, User, user_id: user.id

        can :read, Event, is_public: true
        can :manage, Event,  event_organizer_id: EventOrganizer.where(user_id: user.id)[0].id

        can :read, Organization
        can :manage, Organization do |organization|
          OrganizationAdmin.where(:organization_id => organization.id).
              pluck(:user_id).include? user.id
        end

        can :read, Comment
        can :manage, Comment, user_id: user.id

        can :read, Message, to_id: user.id

        can :read, Inbox, user_id: user.id

        can :read, Poll
        can :manage, Poll do |poll|
          poll.event.event_organizer.user_id == user.id
        end
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

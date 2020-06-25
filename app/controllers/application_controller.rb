class ApplicationController < ActionController::Base
  include Pagy::Backend

  def current_ability
    if system_admin_signed_in?
      @current_ability ||= Ability.new(current_system_admin)
    else
      @current_ability ||= Ability.new(current_user)
    end
  end
end

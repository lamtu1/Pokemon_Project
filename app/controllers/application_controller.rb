class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Add in params to allow things into Devise w/ Blacklight
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:nickname, :fav_pokemon, :quote, :email, :password, :password_confirmation, :current_password)
    end
  end

end

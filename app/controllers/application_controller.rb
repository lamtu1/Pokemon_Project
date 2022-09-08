class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Add in params to allow things into Devise w/ Blacklight
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :nickname, :fav_pokemon, :quote, :password, :password_confirmation, :current_password)
    end
  end

  # Redirect after login
  def after_sign_in_path_for(_resource)
    pokemon_main_path
  end

  # Redirect after update using the root path method instead of update_path
  def user_root_path
    pokemon_main_path
  end
end

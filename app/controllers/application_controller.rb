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
  def after_sign_in_path_for(resource)
    stored_location_for(pokemons) || pokemon_main_path
  end

  # Redirect after update
  def after_update_path_for(resource)
    pokemon_main_path
  end
end

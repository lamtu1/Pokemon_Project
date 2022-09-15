Rails.application.routes.draw do
  # Add in resources to map to different locations for different controller
  resources :elements
  resources :pokemons
  # Blacklight setup for View as a main homepage
  concern :marc_viewable, Blacklight::Marc::Routes::MarcViewable.new
  devise_for :users
  mount Blacklight::Engine => '/'
  root to: "catalog#index"
  concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
    concerns :searchable
  end

  concern :exportable, Blacklight::Routes::Exportable.new

  resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
    concerns [:exportable, :marc_viewable]
  end

  resources :bookmarks do
    concerns :exportable

    collection do
      delete 'clear'
    end
  end

  # Add in a routes to the main page
  get '/pokemons', to: 'pokemons#index', as: 'pokemon_main'
end

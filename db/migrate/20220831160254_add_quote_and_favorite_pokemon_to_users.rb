class AddQuoteAndFavoritePokemonToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :quote, :string
    add_column :users, :fav_pokemon, :string
  end
end

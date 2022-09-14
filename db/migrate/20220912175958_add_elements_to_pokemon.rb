class AddElementsToPokemon < ActiveRecord::Migration[7.0]
  def change
    create_table :elements_pokemons, id: false do |t|
      t.belongs_to :pokemon
      t.belongs_to :element
    end
  end
end

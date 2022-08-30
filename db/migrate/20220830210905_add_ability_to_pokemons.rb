class AddAbilityToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :ability, :string
  end
end

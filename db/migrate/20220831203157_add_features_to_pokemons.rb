class AddFeaturesToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :height, :decimal
    add_column :pokemons, :weight, :decimal
    add_column :pokemons, :male_chance, :integer
    add_column :pokemons, :female_chance, :integer
  end
end

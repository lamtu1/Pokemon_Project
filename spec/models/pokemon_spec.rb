require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  it 'return the Pokemon name' do
    pokemon = Pokemon.create(name: "Bulbasaur")
    expect(pokemon.name).to eq 'Bulbasaur'
  end
end

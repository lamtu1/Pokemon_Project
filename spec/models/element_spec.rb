require 'rails_helper'

RSpec.describe Element, type: :model do
  # ASSOCIATION TEST: Whether the association between Type & Pokemon exist
  it "should have many pokemons" do
    association_e = Element.reflect_on_association(:pokemons)
    expect(association_e.macro).to eq(:has_and_belongs_to_many)
  end
end

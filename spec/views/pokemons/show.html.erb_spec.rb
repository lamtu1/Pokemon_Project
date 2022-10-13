require 'rails_helper'

RSpec.describe "pokemons/show", type: :view do
  before(:each) do
    @data = assign(:pokemon, Pokemon.create!(
      name: "Name",
      ability: "Ability"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end

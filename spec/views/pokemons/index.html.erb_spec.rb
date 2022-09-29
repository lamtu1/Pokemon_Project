require 'rails_helper'

RSpec.describe "pokemons/index", type: :view do
  before(:each) do
    assign(:pokemons, [
      Pokemon.create!(
        name: "Name",
        ability: "Ability"
      ),
      Pokemon.create!(
        name: "Name",
        ability: "Ability"
      )
    ])
  end

  it "renders a list of pokemons" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end

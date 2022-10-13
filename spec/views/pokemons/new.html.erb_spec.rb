require 'rails_helper'

RSpec.describe "pokemons/new", type: :view do
  before(:each) do
    assign(:data, Pokemon.new(
      name: "MyString"
    ))
  end

  it "renders new pokemon form" do
    render

    assert_select "form[action=?][method=?]", pokemons_path, "post" do

      assert_select "input[name=?]", "pokemon[name]"
    end
  end
end

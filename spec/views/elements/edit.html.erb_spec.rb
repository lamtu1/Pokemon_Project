require 'rails_helper'

RSpec.describe "elements/edit", type: :view do
  before(:each) do
    @data = assign(:element, Element.create!(
      power: "MyString"
    ))
  end

  it "renders the edit element form" do
    render

    assert_select "form[action=?][method=?]", element_path(@data), "post" do

      assert_select "input[name=?]", "element[power]"
    end
  end
end

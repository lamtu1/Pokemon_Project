require 'rails_helper'

RSpec.describe "elements/new", type: :view do
  before(:each) do
    assign(:element, Element.new(
      power: "MyString"
    ))
  end

  it "renders new element form" do
    render

    assert_select "form[action=?][method=?]", elements_path, "post" do

      assert_select "input[name=?]", "element[power]"
    end
  end
end

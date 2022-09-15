require 'rails_helper'

RSpec.describe "elements/show", type: :view do
  before(:each) do
    @element = assign(:element, Element.create!(
      power: "Power"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Power/)
  end
end

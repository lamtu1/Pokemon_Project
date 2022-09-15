require 'rails_helper'

RSpec.describe "elements/index", type: :view do
  before(:each) do
    assign(:elements, [
      Element.create!(
        power: "Power"
      ),
      Element.create!(
        power: "Power"
      )
    ])
  end

  it "renders a list of elements" do
    render
    assert_select "tr>td", text: "Power".to_s, count: 2
  end
end

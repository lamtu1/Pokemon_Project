require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  # ASSOCIATION TEST: Whether the association between Pokemon & Type exist
  it "should have many elements" do
    association_p = Pokemon.reflect_on_association(:elements)
    expect(association_p.macro).to eq(:has_and_belongs_to_many)
  end
end

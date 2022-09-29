require 'rails_helper'

RSpec.describe Element, type: :model do
  # ASSOCIATION TEST: Whether the association between Type & Pokemon exist
  describe 'associations' do
    it { should have_and_belong_to_many(:pokemons) }
  end

  # ATTRIBUTES TEST: Testing to make sure the model have all the attributes needed
  describe 'attributes' do
    it { should respond_to(:power) }
  end
end

require 'rails_helper'

RSpec.describe Element, type: :model do
  # ASSOCIATION TEST: Whether the association between Type & Pokemon exist
  describe 'associations' do
    it { should have_and_belong_to_many(:pokemons) }
  end
end

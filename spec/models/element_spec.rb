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

  # METHOD TEST: Testing to make sure that the formatting of the method produce correctly
  describe 'method test' do
    it 'should format data correctly for solr' do
      test_data = Element.create(power: "Ground", id: 8)
      expect(test_data.to_solr).to eq([{"power_ssim" => ["Ground"],
                                        "id"=>"8"}])
    end
  end
end

require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  # ASSOCIATION TEST: Whether the association between Pokemon & Type exist
  describe 'associations' do
    it { should have_and_belong_to_many(:elements) }
  end

  # IMAGE TEST: Testing the image attachment to see it would attach one image
  describe 'image attached' do
    it { should have_one_attached(:image) }
  end

  # ATTRIBUTES TEST: Testing to make sure the model have all the attributes needed
  describe 'attributes' do
    it { should respond_to(:name) }
    it { should respond_to(:ability) }
    it { should respond_to(:male_chance) }
    it { should respond_to(:female_chance) }
    it { should respond_to(:weight) }
    it { should respond_to(:height) }
  end

  # METHOD TEST: Testing to make sure that the formatting of the method produce correctly
  describe 'method test' do
    it 'should format data correctly for solr' do
      test_data = Pokemon.create(name: "Mudkip", ability: "Torrent", male_chance: 88, female_chance: 12, height: 0.4, weight: 16.8, id: 1)
      expect(test_data.to_solr).to eq([{"name_ssim" => ["Mudkip"], 
                                       "ability_ssim" => ["Torrent"],
                                       "male_ssim" => ["88"],
                                       "female_ssim" => ["12"],
                                       "height_ssim" => ["0.4"],
                                       "weight_ssim" => ["16.8"],
                                       "id"=>"1"}])
    end
  end
end

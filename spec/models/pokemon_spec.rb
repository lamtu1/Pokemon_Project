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
end

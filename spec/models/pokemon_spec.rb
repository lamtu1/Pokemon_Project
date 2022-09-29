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

  describe 'GET #index' do
    before { gets :index }

    it { should render_template('index') }
  end
end

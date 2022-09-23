require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  # ASSOCIATION TEST: Whether the association between Pokemon & Type exist
  it { should have_and_belong_to_many(:elements) }
end

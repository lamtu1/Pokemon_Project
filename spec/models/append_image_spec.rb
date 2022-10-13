require 'rails_helper'

RSpec.describe AppendImage, type: :model do
    # APPEND TEST: Whether the image is attach successfully with the object
    describe 'upload images' do
      it 'should return true if an image is attached' do
        pokemon_tst = Pokemon.create(name: "Chimchar", ability: "Blaze")

        AppendImage.new(pokemon_tst).attach_image({io: File.open(Rails.root.join('spec', 'fixtures', 'test.jpg')), 
                                                   filename: "test.jpg", 
                                                   content_type: "image/jpg"})

        expect(pokemon_tst.image.attached?).to be true
      end
    end
end
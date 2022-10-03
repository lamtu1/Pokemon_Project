class Pokemon < ApplicationRecord
    # Add in the one image attachment to the Model
    has_one_attached :image do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end

   # Add in association between Pokemon & Types
   has_and_belongs_to_many :elements

   # Add in validator to the attribute
   validates_format_of :ability, :with => /\A[a-z]+\z/i

   # Create a method to format the data in Pokemon to be added into Solr
   def to_solr()
        # Add in the array to convert into array hash & add in an empty hash
        convert_data = []
        hash_data = {}

        # Take the data from the param to create into hash
        hash_data = { "name_ssim" => [self.name.to_s],
                      "ability_ssim" => [self.ability.to_s],
                      "male_ssim" => [self.male_chance.to_s],
                      "female_ssim" => [self.female_chance.to_s],
                      "height_ssim" => [self.height.to_s],
                      "weight_ssim" => [self.weight.to_s],
                      "id" => self.id.to_s
                    }
        
        # Put the data from hash into the array
        convert_data.push(hash_data)

        # Return the array data
        return convert_data
   end 
end

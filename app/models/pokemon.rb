class Pokemon < ApplicationRecord
    # Add in the one image attachment to the Model
    has_one_attached :image do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end

   # Add in association between Pokemon & Types
   has_and_belongs_to_many :elements

   # Add in validator to the attribute
   validates_format_of :ability, :with => /\A[a-z]+\z/i
end

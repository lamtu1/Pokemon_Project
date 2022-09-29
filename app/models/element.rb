class Element < ApplicationRecord
    # Add in association between Pokemon & Types
    has_and_belongs_to_many :pokemons

    # Add in validator to the attribute
    validates_format_of :power, :with => /\A[a-z]+\z/i
end

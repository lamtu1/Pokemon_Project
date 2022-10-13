class Element < ApplicationRecord
    # Add in association between Pokemon & Types
    has_and_belongs_to_many :pokemons

    # Add in validator to the attribute
    validates_format_of :power, :with => /\A[a-z]+\z/i

    # Create a method to format the data in Pokemon to be added into Solr
    def to_solr
        [solrized_attribute_keys.to_h { |solr_name| [solr_name, [attribute_call(solr_name)]] }.merge!({"id" => id.to_s})]
    end

  
    private

    # Method take in all the key values and attached _ssim to them
    def solrized_attribute_keys
        (self.attributes.keys - %w{created_at updated_at id}).map { |key| "#{key}_ssim" }
    end

    # Take the value keys and get the data out of it and convert to string
    def attribute_call(solr_name)
        self.send(solr_name.gsub("_ssim", "").to_sym).to_s
    end
end

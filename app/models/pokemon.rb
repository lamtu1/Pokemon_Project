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
   def to_solr
     [solrized_attribute_keys.to_h { |solr_name| [solr_name, [attribute_call(solr_name)]] }.merge!({"id" => id.to_s})]
   end

   # Method to setup the connection to solr
   def setup_conn
     conn = Blacklight.default_index.connection
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

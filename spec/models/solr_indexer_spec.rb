require 'rails_helper'

RSpec.describe SolrIndexer, type: :model do
    # SOLR TEST: Whether the data create posted on Solr database is on there
    describe 'index to solr' do
      it 'should push data onto solr correctly and return the query' do
        # Create a Pokemon and have it index to solr as data
        pokemon_tst = Pokemon.create(name: "Piplup", ability: "Torrent")
        SolrIndexer.new(pokemon_tst).index_to_solr

        # Make a connection to SOLR & fetch the search query to see if the Pokemon is in SOLR
        solr = Blacklight.default_index.connection
        response = solr.get 'select', :params => { :q => 'name_ssim:Piplup' }

        expect(response["response"]["docs"].first["name_ssim"]).to eq(["Piplup"])
      end
    end
end
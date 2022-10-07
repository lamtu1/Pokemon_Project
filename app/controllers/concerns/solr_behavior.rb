module SolrBehavior 
    extend ActiveSupport::Concern
    
    included do
        # SET: Set action to perform after a controller is fire
        after_action :index_data, only: %i[ create ]

        # METHOD: Index the data by passing in the data that need to be solrize
        def index_data
            SolrIndexer.new(@pokemon).index_to_solr
        end
    end
end
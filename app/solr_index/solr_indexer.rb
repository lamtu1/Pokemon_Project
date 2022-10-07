class SolrIndexer
    # METHOD: Intialize object when call new
    def initialize(data)
        # Create a connection to solr when intialize & pass data into a variable to use in class
        @conn = Blacklight.default_index.connection
        @data = data
    end

    # METHOD: Index the value onto Solr
    def index_to_solr
        @conn.add @data.to_solr
        @conn.commit
    end
end
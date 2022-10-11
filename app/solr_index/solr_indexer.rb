class SolrIndexer
    # METHOD: Intialize object when call new
    def initialize(data)
        # Create a connection to solr when intialize & pass data into a variable to use in class
        @conn = Blacklight.default_index.connection
        @data = data
    end

    # METHOD: Index the value onto Solr via add & commit
    def index_to_solr
        if (@data.respond_to?(:to_solr))
            @conn.add @data.to_solr
            @conn.commit
        end
    end
end
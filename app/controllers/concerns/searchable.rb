module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    def self.search query
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: query,
              fields: ["name^5", "text"]
            }
          }
        }
      )
    end
  end
end

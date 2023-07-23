class Tweet < ApplicationRecord
    # buscador
    include PgSearch::Model
  
    pg_search_scope :search_by_description_and_username, against: {
    description: 'A',
    username: 'B'
    }, using: {
    tsearch: { prefix: true }
    }

    def index 
    end
end


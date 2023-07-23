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
        @tweets = Tweet.page(params[:page])
        
        if params[:search].present?
            @tweets = Tweet.where('description ILIKE ?', "%#{params[:search]}%").page(params[:page])
          else
            @tweets = Tweet.page(params[:page])
          end
    end
end


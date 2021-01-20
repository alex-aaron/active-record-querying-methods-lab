class Show < ActiveRecord::Base

    def self.highest_rating
        self.maximum(:rating)
    end

    def self.most_popular_show
        highest_rating = self.highest_rating
        highest_rated_show = self.find_by(rating: highest_rating)
    end

    def self.lowest_rating
        self.minimum(:rating)
    end

    def self.least_popular_show
        lowest_rating = self.lowest_rating
        lowest_rated_show = self.find_by(rating: lowest_rating)
    end

    def self.ratings_sum
        self.sum(:rating)
    end

    def self.popular_shows
        self.where('rating >= 5')
        # popular_shows_array = []
        # Show.all.each do |show|
        #     if show.rating > 5
        #         popular_shows_array << show
        #     end
        # end
        # popular_shows_array
    end

    def self.shows_by_alphabetical_order
        self.order(:name)
    end
end
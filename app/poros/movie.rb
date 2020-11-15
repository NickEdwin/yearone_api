class Movie
  def self.top_rated
    movie_service = MovieService.new
    movie_info = movie_service.top_rated

    @movies = movie_info.map do |movie|
      Movie.new(movie)
    end
  end

  attr_reader :original_title,
              :vote_average,
              :id,
              :summary,
              :runtime,
              :release_date

  def initialize(movie_info)
    @original_title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
    @id = movie_info[:id]
    @genres = movie_info[:genres]
    @summary = movie_info[:overview]
    @runtime = movie_info[:runtime]
    @release_date = movie_info[:release_date]
  end
end

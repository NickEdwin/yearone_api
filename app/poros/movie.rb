class Movie
  attr_reader :original_title,
              :vote_average,
              :id,
              :summary,
              :runtime,
              :release_date,
              :poster_path

  def initialize(movie_info)
    @original_title = movie_info[:title]
    @vote_average = movie_info[:vote_average]
    @id = movie_info[:id]
    @genres = movie_info[:genres]
    @summary = movie_info[:overview]
    @runtime = movie_info[:runtime]
    @release_date = movie_info[:release_date]
    @poster_path = movie_info[:poster_path]
  end

  def genre_names
    results = ''
    @genres.map do |genre|
      results << "#{genre[:name]}, "
    end
    results.chomp(', ')
  end
end

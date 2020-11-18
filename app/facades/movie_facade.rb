class MovieFacade
  def self.top_rated
    movie_service = MovieService.new
    movie_info = movie_service.top_rated

    @movies = movie_info.map do |movie|
      Movie.new(movie)
    end
  end

  def self.search(keywords)
    movie_service = MovieService.new
    movie_info = movie_service.search(keywords)

    @movies = movie_info.map do |movie|
      Movie.new(movie)
    end
  end

  def self.details(id)
    movie_service = MovieService.new
    movie_info = movie_service.details(id)
    Movie.new(movie_info)
  end

  def self.cast(id)
    movie_service = MovieService.new
    cast = movie_service.cast(id)

    @cast = cast[:cast].first(10).map do |member|
      Cast.new(member)
    end
  end

  def self.crew(id)
    movie_service = MovieService.new
    cast = movie_service.cast(id)

    @crew = cast[:crew].map do |member|
      Crew.new(member)
    end
  end

  def self.reviews(id)
    movie_service = MovieService.new
    reviews = movie_service.reviews(id)

    @reviews = reviews[:results].map do |review|
      Review.new(review)
    end
  end

  def self.videos(id)
    movie_service = MovieService.new
    videos = movie_service.videos(id)
    trailer = []
    videos[:results].map do |result|
      trailer << result if result[:name].include?('Trailer')
    end
    return trailer[0][:key] unless trailer.empty?
  end

  def self.recommended(id)
    movie_service = MovieService.new
    recommended = movie_service.recommended(id)

    @recommended = recommended[:results].map do |movie|
      Movie.new(movie)
    end
  end
end

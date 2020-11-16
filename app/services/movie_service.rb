class MovieService
  def top_rated
    movies = []
    page_number = 1

    until movies.length >= 40
      top_rated = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&language=en-US&page=#{page_number}")
      movie_list = JSON.parse(top_rated.body, symbolize_names: true)

      movie_list[:results].each do |movie|
        movies << movie
      end

      page_number += 1
    end
    movies
  end

  def search(keywords)
    movies = []
    page_number = 1

    until movies.length >= 40
      search = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&query=#{keywords}&page=#{page_number}")

      movie_list = JSON.parse(search.body, symbolize_names: true)

      movie_list[:results].each do |movie|
        movies << movie
      end

      page_number += 1
    end
    movies
  end

  def details(id)
    movie = conn.get("/3/movie/#{id}?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}")
    JSON.parse(movie.body, symbolize_names: true)
  end

  def cast(id)
    movie_cast = conn.get("/3/movie/#{id}/credits?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}")
    JSON.parse(movie_cast.body, symbolize_names: true)
  end

  def reviews(id)
    reviews = conn.get("/3/movie/#{id}/reviews?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&language=en-US")
    JSON.parse(reviews.body, symbolize_names: true)
  end

  def videos(id)
    videos = conn.get("/3/movie/#{id}/videos?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&language=en-US")
    JSON.parse(videos.body, symbolize_names: true)
  end

  def recommended(id)
    recommended = conn.get("/3/movie/#{id}/recommendations?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&language=en-US")
    JSON.parse(recommended.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end
end

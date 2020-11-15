class MovieService
  def top_rated
    movies = []
    page_number = 1

    until movies.length >=40
      top_rated = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}&language=en-US&page=#{page_number}")
      movie_list = JSON.parse(top_rated.body, symbolize_names: true)

      movie_list[:results].each do |movie|
        movies << movie
      end

      page_number += 1
    end
    movies
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end
end

class MoviesController < ApplicationController
  def top_rated
    @movies = Movie.top_rated
  end

  def search
    @movies = Movie.search(params[:find_movies])
  end
end

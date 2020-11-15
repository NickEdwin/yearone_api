class MoviesController < ApplicationController
  def top_rated
    @movies = Movie.top_rated
  end
end

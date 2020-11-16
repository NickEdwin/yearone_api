class MoviesController < ApplicationController
  def top_rated
    @movies = MovieFacade.top_rated
  end

  def search
    @movies = MovieFacade.search(params[:find_movies])
  end

  def show
    @movie = MovieFacade.details(params[:id])
    @cast = MovieFacade.cast(params[:id])
    @crew = MovieFacade.crew(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
    @trailer = MovieFacade.videos(params[:id])
    @recommended = MovieFacade.recommended(params[:id])
  end
end

class MoviesController < ApplicationController
  def top_rated
    @movies = MovieFacade.top_rated
  end

  def search
    movies = MovieFacade.search(params[:find_movies])
    if movies.any?
      @movies = movies
    else
      flash[:error] = "No movies found, please try again"
      redirect_to '/'
    end
  end

  def show
    @movie = MovieFacade.details(params[:id])
    @cast = MovieFacade.cast(params[:id])
    @crew = MovieFacade.crew(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
    @trailer = MovieFacade.videos(params[:id])
    @recommended = MovieFacade.recommended(params[:id])
    @votes = Vote.find_by(movie_title: @movie.original_title)
  end

  def increase
    movie = Vote.where(movie_title: params[:movie_title]).first_or_create
    movie.thumbs_up += 1
    movie.save
    redirect_back(fallback_location: root_path)
  end

  def decrease
    movie = Vote.where(movie_title: params[:movie_title]).first_or_create
    movie.thumbs_down += 1
    movie.save
    redirect_back(fallback_location: root_path)
  end
end

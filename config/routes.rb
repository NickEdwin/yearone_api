Rails.application.routes.draw do
  get '/', to: 'welcome#index', as: :root

  get '/movies/top_rated', to: 'movies#top_rated'

  post '/movies/search', to: 'movies#search'

end

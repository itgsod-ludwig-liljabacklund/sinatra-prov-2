class App < Sinatra::Base
  enable :sessions

  get '/' do
    @movies = Movie.all
    @cinemas = Cinema.all
    slim :index
  end

  get '/movie/:id' do |movie_id|
    @movie_id = movie_id
    @showings = Showing.all(movie_id: movie_id)
    @cinemas_showing_movie = []
    for showing in @showings
      if showing.movie_id == @movie_id.to_i
        @cinemas_showing_movie << (Cinema.first(id: showing.cinema_id))
      end
    end
    slim :movie
  end


end
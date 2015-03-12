class App < Sinatra::Base
  enable :sessions

  get '/' do
    @movies = Movie.all
    p @movies
    @cinemas = Cinema.all
    p @cinemas
    slim :index
  end


end
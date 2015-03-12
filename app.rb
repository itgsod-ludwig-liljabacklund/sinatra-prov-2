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
    for showing in @showings #Hämtar alla biografer som visar filmen
      if showing.movie_id == @movie_id.to_i
        @cinemas_showing_movie << (Cinema.first(id: showing.cinema_id))
      end
    end
    slim :movie
  end

  get '/movie/:movie_id/cinema/:cinema_id' do |movie_id, cinema_id|
    @movie = Movie.first(id: movie_id)
    @cinema = Cinema.first(id: cinema_id)
    @showings = Showing.all(movie_id: movie_id, cinema_id: cinema_id)
    slim :showings_in_cinema
  end

  get '/cinema/:id' do |cinema_id|
    @cinema = Cinema.first(id: cinema_id)
    showings_in_cinema = Showing.all(cinema_id: cinema_id)
    @movies_in_cinema = showings_in_cinema.movies
    p @movies_in_cinema
    slim :cinema
  end

  get '/book_showing/:id' do |showing_id|
    @showing = Showing.get(showing_id)
    @movie = Movie.first(id: @showing.movie_id)
    @cinema = Cinema.first(id: @showing.cinema_id)
    @room = Room.first(id: @showing.room_id)
    slim :book_showing
  end

  post '/book_showing/:id' do |showing_id|
    Booking.create(name: params['name'], showing_id: showing_id)
    redirect '/'
  end

end
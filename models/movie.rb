class Movie
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :runtime, Integer, :required => true

  has n, :showings
end
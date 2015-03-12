class Room
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :number_of_seats, Integer, :required => true

  has n, :showings
  belongs_to :cinema
end
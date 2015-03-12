class Showing
  include DataMapper::Resource

  property :id, Serial
  property :start_time, DateTime, :required => true

  belongs_to :movie
  belongs_to :cinema
  belongs_to :room
  has n, :bookings
end
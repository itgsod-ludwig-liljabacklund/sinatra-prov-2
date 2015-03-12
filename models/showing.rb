class Showing
  include DataMapper::Resource

  property :id, Serial
  property :start_time, Integer, :required => true

  belongs_to :movie
  belongs_to :cinema
  belongs_to :room
end
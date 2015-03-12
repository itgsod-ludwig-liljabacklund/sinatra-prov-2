class Cinema
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true

  has n, :showings
  has n, :rooms

  # def rooms
  #   Room.all(cinema_id: self.id)
  # end
end
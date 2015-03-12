class Cinema
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true

  has n, :showing
  has n, :room
end
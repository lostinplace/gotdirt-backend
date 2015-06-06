class Story
  include Mongoid::Document
  field :user, type: String
  field :story, type: String
  field :about_who, type: String
  field :lat, type: Double
  field :lon, type: Double
end

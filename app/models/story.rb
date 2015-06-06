class Story
  include Mongoid::Document
  field :user, type: String
  field :story, type: String
  field :about_who, type: String
  field :lat, type: Integer
  field :lon, type: Integer
end

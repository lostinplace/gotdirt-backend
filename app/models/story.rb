class Story
  include Mongoid::Document
  field :user, type: String
  field :story, type: String
  field :about_who, type: String
  field :tags, type: String
  field :lat, type: Float
  field :lon, type: Float
  field :date_time, type: DateTime
end

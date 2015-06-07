json.array!(@stories) do |story|
  json.extract! story,  :id, :user, :story, :about_who, :lat, :lon, :date_time, :tags
  json.url story_url(story, format: :json)
end

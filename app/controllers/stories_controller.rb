require 'net/http'

class StoriesController < ApplicationController

  before_action :set_story, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index

    if params[:user]
      @stories = Story.where(:user => params[:user]).order_by([:date_time, :desc])
    else 
      @stories = Story.order_by([:date_time, :desc])
    end
    respond_with(@stories)
  end

  def show
    respond_with(@story)
  end

  def new
    @story = Story.new
    respond_with(@story)
  end

  def edit
  end

  def create
    @story = Story.new(story_params)
    @story.save

    # notify apps of the update
    kick_it

    respond_with(@story)
  end

  def update
    @story.update(story_params)
    respond_with(@story)
  end

  def destroy
    @story.destroy
    respond_with(@story)
  end

  def kick_it

    d = { :where => {}, :data => { :content_available => 1 } }.to_json
    x = {:content_type => :json,  :accept => :json, 'X-Parse-Application-Id' => 'ZMxqeVdkwRrzYkxZXcIVpLFfdQv8EKHbimvDgMUi',  'X-Parse-REST-API-Key' => 'ajE8BLrvIZRG767n1AMq5kVF76UHY0WxRJOmbspe'}
    RestClient.post "https://api.parse.com/1/push", d,  x

 end

  private
    def set_story
      @story = Story.find(params[:id])
    end

    def story_params
      params.permit(:story, :user, :about_who, :lat, :lon, :date_time, :tags)
    end
end

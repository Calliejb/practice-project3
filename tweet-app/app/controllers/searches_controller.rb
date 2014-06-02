class SearchesController < ApplicationController
	require 'rubygems'
	require 'twitter'
  def index
  	@searches = Search.all
  	@search = Search.new(params[:term])





  	twitter = Twitter::REST::Client.new do |config|
  	  config.consumer_key        = "ZVIgrKzFHV0s7MkUPsUaRxSB0"
  	  config.consumer_secret     = "8ZvyhbwenIBiiDZX2V5jbfCyClvliVX08nBmKCJWs8JthZDapL"
  	  config.access_token        = "30171655-TFN84aT0l0qqI5BgxCCko9Ueg2iHNCOlFPQhmBiw2"
  	  config.access_token_secret = "nGsiCp8tgYZ90CbDSfDjgB4ytCnF9GqXbb40XLetkGPpi"
  	end

  	# @searches = Search.all

  	@tweets = twitter.search("summer", result_type: "recent").take(1000)
  	t = @tweets
  	@t1 = @tweets[0].to_h

    t.each do |ttt|
      hasht = ttt.to_h
      @text = hasht[:text]
      @created_at = hasht[:created_at]
      @location = hasht[:user][:location]
      @coordinates = hasht[:coordinates]
    end


  	
  	twitter.search("hello", result_type: "recent").take(5).each do |tweet|
  		@twt = tweet.text
  	end

  end

  def show
  end
end
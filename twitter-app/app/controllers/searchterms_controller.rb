class SearchtermsController < ApplicationController


  def index
    require 'rubygems'
    require 'twitter'
   
    Twitter.configure do |config|
     config.consumer_key = account['consumer_key']
     config.consumer_secret = account['consumer_secret']
     config.oauth_token = account['oauth_token']
     config.oauth_token_secret = account['oauth_token_secret']
    end

    search = Twitter::Search.new
   
    search.containing("marry me").to("justinbieber").result_type("recent").per_page(3).each do |r|
      puts "#{r.from_user}: #{r.text}"
    end
  end

  def new
  end

  def create
  end


  def edit
  end

  def update
  end

  def destroy
  end
end

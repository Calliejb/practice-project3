class Search < ActiveRecord::Base


	require 'rubygems'
	require 'oauth'

	# Change the following values to those provided on dev.twitter.com
	# The consumer key identifies the application making the request.
	# The access token identifies the user making the request.
	consumer_key = OAuth::Consumer.new(
	    "ZVIgrKzFHV0s7MkUPsUaRxSB0",
	    "8ZvyhbwenIBiiDZX2V5jbfCyClvliVX08nBmKCJWs8JthZDapL")
	access_token = OAuth::Token.new(
	    "30171655-TFN84aT0l0qqI5BgxCCko9Ueg2iHNCOlFPQhmBiw2",
	    "nGsiCp8tgYZ90CbDSfDjgB4ytCnF9GqXbb40XLetkGPpi")


	# Set up Net::HTTP to use SSL, which is required by Twitter.
	http = Net::HTTP.new address.host, address.port
	http.use_ssl = true
	http.verify_mode = OpenSSL::SSL::VERIFY_PEER

	# All requests will be sent to this server.
	baseurl = "https://api.twitter.com"
	path = "/1.1/search/tweets.json"
	query   = URI.encode_www_form("q" => "happy")
	address = URI("#{baseurl}#{path}?#{query}")

	# def print_tweet(tweet)

	# end



	# Build the request and authorize it with OAuth.
	request = Net::HTTP::Get.new address.request_uri
	request.oauth! http, consumer_key, access_token

	# Issue the request and return the response.

	request.oauth! http, consumer_key, access_token
	http.start
	response = http.request request

	# Parse and print the Tweet if the response code was 200
	@tweet = nil
	if response.code == '200' then
	  @tweet = JSON.parse(response.body)

	  # @twt = print_tweet(tweet)
	end


	# def self.party(term)
	# 	term ||= "great"

		
	# 	# q = movie
	# 	# page_limit = 1
	# 	search_url = "https://api.twitter.com/1.1/search/tweets.json"
		



	# 	# HTTParty.get("http://api.twitter.com/1/followers/ids.json?user_id=4")
	# 	# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
		 
	# 	  consumer = OAuth::Consumer.new("ZVIgrKzFHV0s7MkUPsUaRxSB0", "8ZvyhbwenIBiiDZX2V5jbfCyClvliVX08nBmKCJWs8JthZDapL",
	# 	    { :site => "http://api.twitter.com",
	# 	      :scheme => :header
	# 	    })
	# 	  # now create the access token object from passed values
	# 	  token_hash = { :oauth_token => "30171655-TFN84aT0l0qqI5BgxCCko9Ueg2iHNCOlFPQhmBiw2",
	# 	                 :oauth_token_secret => "nGsiCp8tgYZ90CbDSfDjgB4ytCnF9GqXbb40XLetkGPpi"
	# 	               }
	# 	  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

	# 	auth = { query: { apikey: access_token, q: term }}
		  
	# 	HTTParty.get search_url, auth
		 

		 
	# 	# Exchange our oauth_token and oauth_token secret for the AccessToken instance.
		 
	# 	# use the access token as an agent to get the home timeline
	# 	# response = access_token.request(:get, "https://api.twitter.com/1.1/search/tweets.json")

	# 	# puts response

	# 	# auth = { query: { apikey: 'ZVIgrKzFHV0s7MkUPsUaRxSB0' }}
	# 	# id = response["movies"][0]["id"]
	# 	# # id = '770672122'
	# 	# movie_url = "http://api.rottentomatoes.com/api/public/v1.0/movies/#{id}.json"

	# 	# response = HTTParty.get movie_url, auth
		
	end


end

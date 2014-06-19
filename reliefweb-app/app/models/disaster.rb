require 'httparty'

class Disaster < ActiveRecord::Base

	include HTTParty
	
	def self.get_all_countries
		disasters = HTTParty.get("http://api.rwlabs.org/v1/disasters?sort[]=date:desc&limit=30")
		disasters["data"].map do |d|
			d["fields"]["name"].partition(":")[0]
		end
	end

	def self.get_all_disasters
		disasters = HTTParty.get("http://api.rwlabs.org/v1/disasters?sort[]=date:desc&limit=30")
		disasters["data"].map do |d|
			d["fields"]["name"].partition(":")[2]
		end
	end

		# disasters["data"].each do |d|
		# 	country = d["fields"]["name"].partition(":")[0]
		# 	disaster = d["fields"]["name"].partition(":")[2]
		# end


	# def self.party(disaster)
	# 	disaster ||= "matrix"

	# 	# q = movie
	# 	# page_limit = 1
	# 	disasters_url = "http://api.rwlabs.org/v1/disasters.json"
		
	# 	response = HTTParty.get disasters_url

	# 	# id = response["disasters"][0]["id"]
	# 	# # id = '770672122'
	# 	# disaster_url = "http://api.rwlabs.org/v1/disasters/#{id}.json"

	# 	# response = HTTParty.get disaster_url
		
	# end
end

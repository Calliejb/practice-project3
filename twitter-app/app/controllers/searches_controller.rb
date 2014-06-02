class SearchesController < ApplicationController

  def index
  	# @searches = Search.all
    # @search = Search.new
    # @term = Search.party(params[:term])
   	@twt = @tweet
  end

  def show
  end
end

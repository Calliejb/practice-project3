class Brewery < ActiveRecord::Base
  has_many :beers
  belongs_to :emotion
end

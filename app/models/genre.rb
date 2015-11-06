class Genre < ActiveRecord::Base
  
  include Slugifiable
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  
  before_save do 
  	self.slug_name = slug
  end
  
end
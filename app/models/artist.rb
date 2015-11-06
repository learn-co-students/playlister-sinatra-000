class Artist < ActiveRecord::Base
  
  include Slugifiable
  
  has_many :songs
  has_many :genres, through: :songs
  
  before_save do 
  	self.slug_name = slug
  end
  
end
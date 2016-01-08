class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  ###why didn't the module from the lib/ folder work??
  ###include Slugs

  def slug
    self.name.downcase.gsub(" ","-") 
  end

  def self.find_by_slug(artist_slug)
    Artist.all.find {|a| a.slug == artist_slug}
  end

end
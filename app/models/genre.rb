class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  ###has_and_belongs_to_many :songs 

  ###why didn't the module from the lib/ folder work??
  ###include Slugs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(genre_slug)
    Genre.all.find {|g| g.slug == genre_slug}
  end

end
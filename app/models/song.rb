class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist

  ###has_and_belongs_to_many :genres

  ###why didn't the module from the lib/ folder work??
  ###include Slugs

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(song_slug)
    Song.all.find {|s| s.slug == song_slug}
  end

end
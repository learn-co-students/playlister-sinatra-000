class Song < ActiveRecord::Base

has_many :genres, through: :songs_genres
has_many :songs_genres
belongs_to :artist

  def slug
    slug_name = name.gsub(" ", "-")
    slug_name.downcase
  end

  def self.find_by_slug(slugged_name)
    baby = slugged_name.gsub("-", " ")
    new_baby = baby.split.map(&:capitalize).join(" ")
    Song.where('name LIKE ?', new_baby).first
  end

end
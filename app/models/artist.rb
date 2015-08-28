class Artist < ActiveRecord::Base

has_many :songs
has_many :genres, through: :songs


   def slug
    slug_name = name.gsub(" ", "-")
    slug_name.downcase
  end

  def self.find_by_slug(slugged_name)
    baby = slugged_name.gsub("-", " ")
    new_baby = baby.split.map(&:capitalize).join(" ")
    Artist.where('name LIKE ?', new_baby).first
  end

end
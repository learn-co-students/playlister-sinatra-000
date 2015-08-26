class Song < ActiveRecord::Base
	include Slug
	extend FindBySlug
	belongs_to :artist
	has_many :genres, through: :song_genres
	has_many :song_genres
end

class Artist < ActiveRecord::Base
	include Slug
	extend FindBySlug
	has_many :songs
	has_many :genres, through: :songs
end
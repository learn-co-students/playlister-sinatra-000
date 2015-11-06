class CreateSongGenres < ActiveRecord::Migration
  def change
  	create_table :song_genres do |t|
  	  t.references :song
  	  t.references :genre
  	end
  end
end
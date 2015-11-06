class CreateSongs < ActiveRecord::Migration
  def change
  	create_table :songs do |t|
  	  t.string :name
  	  t.string :slug_name
  	  t.references :artist
  	end
  end
end
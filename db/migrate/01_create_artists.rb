class CreateArtists < ActiveRecord::Migration
  def change
  	create_table :artists do |t|
  	  t.string :name
  	  t.string :slug_name
  	end
  end
end
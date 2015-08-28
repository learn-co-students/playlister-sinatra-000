class CreateArtists < ActiveRecord::Migration


  def change
    create_table :artists do |t|
      t.string :name
      t.references :song
      t.references :genre
    end
  end

end
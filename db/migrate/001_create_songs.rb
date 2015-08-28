class CreateSongs < ActiveRecord::Migration


  def change
    create_table :songs do |t|
      t.string :name
      t.belongs_to :genre, index: true
      t.references :artist
      t.references :genre
    end
  end

end
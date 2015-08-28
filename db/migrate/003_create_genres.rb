class CreateGenres < ActiveRecord::Migration


  def change
    create_table :genres do |t|
      t.string :name
      t.references :artist
      t.references :songs
    end
  end

end
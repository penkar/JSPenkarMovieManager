class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :format
      t.integer :length
      t.integer :release_year
      t.integer :rating

      t.timestamps
    end
  end
end

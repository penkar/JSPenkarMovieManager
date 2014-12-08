class AddUserIdtoMovies < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      t.references :user
    end
  end
end

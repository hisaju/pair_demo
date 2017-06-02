class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :comment
      t.string :video

      t.timestamps null: false
    end
  end
end

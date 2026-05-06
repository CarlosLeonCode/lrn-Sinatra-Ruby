class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.boolean :watched, default: false

      t.timestamps
    end
  end
end

class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year
      t.string :rate
      t.date :released
      t.string :runtime
      t.string :director
      t.string :writer
      t.string :plot
      t.string :language
      t.string :country
      t.string :poster
      t.string :imdb_id , null: false , index: true
      t.string :production

      t.timestamps
    end
  end
end

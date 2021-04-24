class AddImdbRatingToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :imdb_rating, :float
  end
end

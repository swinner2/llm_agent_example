class CreateImdbMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :imdb_movies do |t|
      t.integer :movie_id
      t.string :title
      t.string :genres
      t.text :description
      t.string :director
      t.string :cast
      t.integer :year
      t.integer :runtime
      t.float :rating
      t.integer :votes
      t.decimal :revenue
      t.integer :metascore
      t.vector :embedding

      t.timestamps
    end
  end
end

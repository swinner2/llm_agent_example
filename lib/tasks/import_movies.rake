require 'csv'

namespace :movies do
  desc 'Import movies from CSV and generate embeddings'
  task import: :environment do
    csv_file = Rails.root.join('imdb_movie_dataset.csv')
    
    puts "Starting import process..."
    total_rows = CSV.read(csv_file, headers: true).count
    imported = 0
    
    CSV.foreach(csv_file, headers: true) do |row|
      # Create embedding for the movie based on title and description
      text_for_embedding = "#{row['Title']}. #{row['Genre']}. #{row['Description']}."
      embedding = RubyLLM.embed(text_for_embedding)

      # Create the movie record
      ImdbMovie.create!(
        movie_id: row[0],
        title: row['Title'],
        genres: row['Genre'],
        description: row['Description'],
        director: row['Director'],
        cast: row['Actors'],
        year: row['Year'],
        runtime: row['Runtime (Minutes)'],
        rating: row['Rating'],
        votes: row['Votes'],
        revenue: row['Revenue (Millions)'],
        metascore: row['Metascore'],
        embedding: embedding.vectors
      )
      
      imported += 1
      if (imported % 10).zero?
        puts "Imported #{imported}/#{total_rows} movies (#{(imported.to_f/total_rows * 100).round(1)}%)"
      end
    end
    
    puts "\nImport completed! Imported #{imported} movies."
  end
end 
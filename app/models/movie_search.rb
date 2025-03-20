class MovieSearch < RubyLLM::Tool
  description "use this tool to find movies or answer questions about movies and their metadata like score, rating, costs, director, actors, and more."

  param :query, 
    type: :string, 
    desc: "query used to vector search on movies",
    required: true

  def execute(query:)
    ImdbMovie.semantic_search(query).first(3).map do |movie|
      {
        title: movie.title,
        genres: movie.genres,
        year: movie.year,
        rating: movie.rating,
        description: movie.description,
        director: movie.director,
        cast: movie.cast,
        votes: movie.votes,
        revenue: movie.revenue,
        metascore: movie.metascore,
      }
    end
  rescue => e
    { error: e.message }
  end
end

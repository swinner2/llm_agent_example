class ImdbMovie < ApplicationRecord
  has_neighbors :embedding

  # Search movies by similarity
  def self.semantic_search(query, limit: 10)
    embedding = RubyLLM.embed(query)
    nearest_neighbors(:embedding, embedding.vectors, distance: :cosine)
  end

  # Search by traditional filters combined with semantic search
  def self.advanced_search(query:, year: nil, min_rating: nil, limit: 10)
    scope = all

    # Apply traditional filters
    scope = scope.where(year: year) if year
    scope = scope.where('rating >= ?', min_rating) if min_rating

    # Generate embedding for semantic search
    embedding = RubyLLM.embed(query)

    # Combine filters with semantic search
    scope.nearest_neighbors(:embedding, embedding.vectors, distance: :cosine)
  end
end

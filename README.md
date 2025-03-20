# LLM Agent Example

A demonstration project showcasing different LLM agent patterns using the ruby_llm gem.

## Overview

This project demonstrates various Large Language Model (LLM) agent capabilities:

- **Basic Chat**: Interactive conversations with a helpful AI assistant
- **Tool Calls**: Enabling the LLM to use external tools for enhanced functionality
- **RAG (Retrieval Augmented Generation)**: Vector search for movies to answer domain-specific questions

### Integrated Tools
- **Dad Joke Generator**: Fetches random dad jokes from an external API
- **Image Generation**: Creates images based on text prompts
- **Reddit Posts**: Retrieves the latest posts from Reddit
- **Movie Search**: Vector-based semantic search for movie information (actors, directors, ratings, etc.)

## Getting Started

1. Setup database
```bash
bin/rails db:create db:migrate db:seed
```

1. Import movie dataset
```bash
bin/rails import:movies
```

1. Start the server
```bash
bin/dev
```

1. Visit `http://localhost:3000` in your browser

## Usage Examples

### Chat Interaction
- Start a new chat and interact with the AI assistant
- Ask general questions or have casual conversation

### Tool Usage
- Ask for a dad joke: "Tell me a dad joke"
- Generate an image: "Create an image of a space cat"
- Get Reddit updates: "What's trending on Reddit?"

### Movie Information
- Query movie details: "Who directed The Godfather?"
- Find recommendations: "What are some good sci-fi movies from the 90s?"
- Compare movies: "Which had better reviews, Avatar or Titanic?"


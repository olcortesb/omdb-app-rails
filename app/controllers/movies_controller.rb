# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all.order(created_at: :desc)
  end

  def search
    movies_local = Movie.where("title LIKE :query", query: params[:movie])

    if params[:year]
      movie_local = movies_local.find { |m| m.year == params[:year] }
    end

    movie_local = if movie_local then
                    movie_local
                  else
                    movies_local.first
                  end

    unless movie_local
      movies = find_movies(params[:movie] ,params[:year])

      if movies["Response"] == "False"
        flash[:alert] = "Pelicula no encontrada"
        return redirect_to root_path
      end

      @movie = save_movie(movies)
      return
    end

    @movie = movie_local
  end

  private

  def save_movie(movies)
    movie_save = Movie.find_or_create_by(imdb_id: movies['imdbID']) do |m|
      m.title = movies['Title']
      m.year = movies['Year']
      m.rate = movies['Rated']
      m.released = movies['Released']
      m.runtime = movies['Runtime']
      m.director = movies['Director']
      m.writer = movies['Writer']
      m.plot = movies['Plot']
      m.language = movies['Language']
      m.country = movies['Country']
      m.poster = movies['Poster']
      m.imdb_id = movies['imdbID']
      m.production = movies['Production']
      m.imdb_rating = movies['imdbRating']
    end
    return movie_save
  end

  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host
      }
    )
    return nil if response.status != 200
    JSON.parse(response.body, object_class: OpenStruct)
  end

  def find_movies(name,year)
    request_api(
      "http://www.omdbapi.com/?i=tt3896198&apikey=9a044c5c&t=#{name}&y=#{year}"
    )
  end
end
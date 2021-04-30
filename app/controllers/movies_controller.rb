# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = Movie.all.most_recent
  end

  def search
    movies = find_movies(params[:movie], params[:year])

    return redirect_to root_path, alert: 'Película no encontrada' if (movies['Response'] == 'False')

    movie = save_movie(movies)
    redirect_to movie_path(movie.id)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def save_movie(movies)
    Movie.find_or_create_by(imdb_id: movies['imdbID']) do |m|
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
      "http://www.omdbapi.com/?apikey=#{Rails.application.credentials.omdb_api_key}&t=#{name}&y=#{year}"
    )
  end
end
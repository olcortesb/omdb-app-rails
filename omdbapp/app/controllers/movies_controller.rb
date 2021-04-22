# frozen_string_literal: true

class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def search
        movies = find_movies(params[:movie] || "")

        if movies["Response"] == "False"
            flash[:alert] = "Pelicula no encontrada"
            return redirect_to root_path
        end

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
        end

        @movie = movies
        #@weather = find_weather(@country['capital'], @country['alpha2Code'])
    end

    private
    def request_api(url)
      response = Excon.get(
        url,
        headers: {
          'X-RapidAPI-Host' => URI.parse(url).host
        }
      )
      return nil if response.status != 200
      JSON.parse(response.body)
    end

    def find_movies(name)
      request_api(
        "http://www.omdbapi.com/?i=tt3896198&apikey=9a044c5c&t=#{name}"
      )
    end
end
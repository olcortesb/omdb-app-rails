# frozen_string_literal: true

class MoviesController < ApplicationController
    def index
    end

    def search
        movies = find_movies(params[:movie])
        
        unless movies
            flash[:alert] = "Pelicula no encontrada"
            return render action: :index
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
        "http://www.omdbapi.com/?i=tt3896198&apikey=9a044c5c&t="+name
      )
    end
end
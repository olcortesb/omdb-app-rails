# frozen_string_literal: true

class MetricsController < ApplicationController
  def home
    @latest = Movie.all.order(:year).take
    @count = Movie.all.count
    @rating = Movie.where("imdb_rating > ?", 0).order(imdb_rating: :desc).take

    all_movie = Movie.where("runtime != ?", 'N/A')
    runtime_max = 0
    all_movie.each { |m|
      r = Integer(m.runtime.split(" ")[0])
      if r > runtime_max
        runtime_max = r
        @runtime_max = m
      end
    }

  end
end
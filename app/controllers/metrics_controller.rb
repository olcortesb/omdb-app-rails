# frozen_string_literal: true

class MetricsController < ApplicationController
  def home
    @latest = Movie.all.order(:year).take
    @recent = Movie.all.order(created_at: :desc).take
    @count = Movie.all.count
    @rating = Movie.where("imdb_rating > ?", 0).order(imdb_rating: :desc).take
    @year_average = Integer(Movie.average(:year))


    all_movie = Movie.where("runtime != ?", 'N/A')
    runtime_max = 0
    avg = 0
    all_movie.each { |m|
      r = Integer(m.runtime.split(" ")[0])
      avg = avg + r
      if r > runtime_max
        runtime_max = r
        @runtime_max = m
      end
      @year_runtime = avg / @count
    }

    @by_year = Movie.all.group_by(&:year)

  end
end
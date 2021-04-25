# frozen_string_literal: true

class MetricsController < ApplicationController

  def home
    @latest = Movie.all.order(:year).take
    @recent = Movie.all.most_recent.take
    @count = Movie.all.count
    @rating = Movie.where('imdb_rating > ?', 0).order(imdb_rating: :desc).take
    @year_average = Integer(Movie.average(:year))
    @runtime_max, @year_runtime = runtime_metrics
    @by_year = Movie.all.group_by(&:year)
  end

  private

  def runtime_metrics
    all_movie = Movie.where('runtime != ?', 'N/A')
    runtime_max = avg = 0
    all_movie.each { |m|
      r = Integer(m.runtime.split(' ')[0])
      avg += r
      runtime_max = r if r >= runtime_max
      @runtime_max_m = m if r >= runtime_max
      @year_runtime_avg = avg / @count
    }
    [@runtime_max_m, @year_runtime_avg]
  end

end

# frozen_string_literal: true

class MetricsController < ApplicationController
  def home
    @latest = Movie.all.order(:year).take
    @count = Movie.all.count
  end
end
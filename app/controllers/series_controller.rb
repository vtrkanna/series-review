# frozen_string_literal: true

# SeriesController
class SeriesController < ApplicationController
  before_action :set_series, only: [:show]
  def index
    @series = Series.search(params[:query]) if params[:query].present?
    @series ||= Series.order(created_at: :desc)
  end

  def show
    @reviews = @series.reviews.order(created_at: :desc)
    render partial: 'series/show_modal'
  end

  private

  def set_series
    @series = Series.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    'Invalid Series'
  end
end

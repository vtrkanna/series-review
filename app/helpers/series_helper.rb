# frozen_string_literal: true

# SeriesHelper
module SeriesHelper
  def time_difference(start, ending)
    if start != ending && start.to_i < ending.to_i
      medidas = %w[year month day hour minute second]
      array = [1970, 1, 1, 0, 0, 0]
      text = ''
      Time.at(ending - start).utc.to_a.take(6).reverse.each_with_index do |num, idx|
        next unless (text =~ /(hour|day|year)/).nil?

        text = "#{text} #{I18n.translate medidas[idx].to_sym, count: num - array[idx]}"
      end
      text.strip.squish.to_s
    else
      '0 seconds'
    end
  end

  def show_raiting(rating = 0)
    rating = rating.to_f
    output_stars = ''
    rating.floor.times do
      output_stars += render_rating('fa-star', 'btn-warning')
    end
    output_stars += render_rating('fa-star-half', 'btn-warning') unless (rating % 1).zero?
    (5 - rating).floor.times do
      output_stars += render_rating('fa-star', 'btn-default btn-grey')
    end
    output_stars.html_safe
  end

  def show_rating_breakdown(reviews = [])
    output_stars = ''
    grouped = group_rate(reviews)
    grouped.each do |rate, count|
      output_stars += render_breakdown(rate, count)
    end
    output_stars.html_safe
  end

  private

  def render_rating(icon, button)
    render partial: '/series/rating', locals: { icon_class: icon, button_class: button }
  end

  def render_breakdown(rate, count)
    render partial: '/series/rating_breakdown', locals: { rate:, count: }
  end

  def group_rate(reviews)
    grouped = reviews.group_by { |e| e }.transform_values(&:length)
    missed = (1..5).to_a - grouped.keys
    missed.map { |v| grouped[v] = 0 }
    grouped.sort_by { |k, _v| k }.to_a.reverse.to_h
  end
end

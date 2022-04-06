# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id         :uuid             not null, primary key
#  data       :jsonb
#  review     :text             not null
#  stars      :integer          not null
#  user_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  series_id  :uuid             not null
#
require 'rails_helper'

RSpec.describe Review, type: :model do
  it 'is not validate without stars' do
    expect(Review.new).to_not be_valid
  end

  it 'with validdata ' do
    series = Series.create(name: Faker::Movie.title)
    review = Review.create(stars: 2, user_name: Faker::Name.name, review: Faker::String.random, series_id: series.id)
    expect(review).to be_valid
  end
end

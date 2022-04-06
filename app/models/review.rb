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
# Review
class Review < ApplicationRecord
  validates_presence_of :stars, :review, :user_name
end

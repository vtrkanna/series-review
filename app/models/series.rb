# frozen_string_literal: true

# == Schema Information
#
# Table name: series
#
#  id            :uuid             not null, primary key
#  country       :string
#  data          :jsonb
#  genre         :string
#  name          :string           not null
#  release_date  :date
#  seasons_count :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Series
class Series < ApplicationRecord
  store_accessor :data, :shoot_locations, :director_ids, :actor_ids

  has_many :reviews

  include PgSearch::Model

  pg_search_scope :search, against: %i[name genre]

  validates_presence_of :name

  before_create :set_default_data

  def directors
    return [] if director_ids.blank?

    User.where(id: director_ids.to_a)
  end

  def actors
    return [] if actor_ids.blank?

    User.where(id: actor_ids.to_a)
  end

  private

  def set_default_data
    self.shoot_locations ||= []
    self.director_ids ||= []
    self.actor_ids ||= []
  end
end

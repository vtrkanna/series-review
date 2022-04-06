# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  data       :jsonb
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# User
class User < ApplicationRecord
  store_accessor :data, :series_ids, :roles

  validates_presence_of :name

  before_create :set_default_data

  private

  def set_default_data
    self.series_ids ||= []
    self.roles ||= []
  end
end

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
require 'rails_helper'

RSpec.describe Series, type: :model do
  context 'Series validation' do
    it 'is not validate without name' do
      expect(Series.new).to_not be_valid
    end
  end
end

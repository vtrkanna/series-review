# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SeriesHelper. For example:
#
# describe SeriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SeriesHelper, type: :helper do
  context 'check time_difference' do
    let(:start_time) { 30.days.ago }
    let(:end_time) { Time.zone.now }

    it 'is valid reverse time format' do
      result = time_difference(end_time, start_time)
      expect(result).to eq('0 seconds')
    end

    it 'invalid inputs' do
      result = time_difference('end_time', 'start_time')
      expect(result).to eq('0 seconds')
    end

    it 'is return valid output' do
      result = time_difference(start_time, end_time)
      expect(result).to eq('30 days')
    end
  end

  context 'show_raiting' do
    it 'return valid output' do
      result = show_raiting(4)
      expect(result).to match(/btn btn-sm/)
    end
  end

  context 'show_rating_breakdown' do
    it 'return valid output' do
      result = show_rating_breakdown([2, 4, 1])
      expect(result).to match(/progressbar-1/)
    end
  end
end

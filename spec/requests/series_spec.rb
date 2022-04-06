# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Series', type: :request do
  describe 'GET /index' do
    it 'eturns a successful response' do
      get root_path
      expect(response).to be_successful
    end

    it 'request list of all series' do
      series = Series.create(name: Faker::Movie.title)
      get root_path
      expect(response.body).to include(series.name)
    end

    it 'renderins show' do
      series = Series.create(name: Faker::Movie.title)
      get show_series_path(series)
      expect(response).to render_template('series/_show_modal')
    end
  end
end

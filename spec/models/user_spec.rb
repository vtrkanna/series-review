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
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User validation' do
    it 'is not validate without name' do
      expect(User.new).to_not be_valid
    end

    it 'return error messages' do
      user = User.new
      user.valid?
      expect(user.errors.full_messages.first).to eq("Name can't be blank")
    end
  end
end

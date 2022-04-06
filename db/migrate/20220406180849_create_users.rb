# frozen_string_literal: true

# Create user table
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.jsonb :data, default: {}
      t.timestamps
    end
  end
end

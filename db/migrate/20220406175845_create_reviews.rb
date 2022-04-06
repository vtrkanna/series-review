# frozen_string_literal: true

# Create review table
class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.uuid :series_id, null: false
      t.string :user_name, null: false
      t.text :review, null: false
      t.integer :stars, null: false
      t.jsonb :data, default: {}
      t.timestamps
    end
  end
end

# frozen_string_literal: true

# Create Series table
class CreateSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :series, id: :uuid do |t|
      t.string :name, null: false
      t.string :genre
      t.integer :seasons_count
      t.date :release_date
      t.string :country
      t.jsonb :data, default: {}
      t.timestamps
    end
  end
end

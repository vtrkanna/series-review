# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

# Load TV Series csv
CSV.foreach(Rails.root.join('db/seed_csv/tv_series.csv'), headers: true) do |row|
  # Load Series
  series = Series.find_or_create_by(
    name: row['TV Series'],
    genre: row['Genre'],
    seasons_count: row['No of seasons'],
    release_date: Date.parse(row['Date of First Release']),
    country: row['Country']
  )

  series.shoot_locations ||= []
  series.shoot_locations << row['Shoot location'] unless series.shoot_locations.to_a.any?(row['Shoot location'])
  series.save!

  director = User.find_or_create_by(name: row['Director'])
  director.series_ids ||= []
  director.series_ids << series.id
  director.roles ||= []
  director.roles << 'director'
  director.save!

  actor = User.find_or_create_by(name: row['Actor'])
  actor.series_ids ||= []
  actor.series_ids << series.id
  actor.roles ||= []
  actor.roles << 'actor'
  actor.save!

  series.director_ids ||= []
  series.actor_ids ||= []
  series.director_ids << director.id
  series.actor_ids << actor.id
  series.director_ids.uniq!
  series.actor_ids.uniq!
  series.save!
end

# Load Reviews csv
CSV.foreach(Rails.root.join('db/seed_csv/reviews.csv'), headers: true) do |row|
  series = Series.find_by(name: row['TV Series'])
  Review.find_or_create_by(
    user_name: row['User'],
    stars: row['Stars'],
    review: row['Review'],
    series_id: series.id
  )
end

# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_406_180_849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pgcrypto'
  enable_extension 'plpgsql'

  create_table 'reviews', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.uuid 'series_id', null: false
    t.string 'user_name', null: false
    t.text 'review', null: false
    t.integer 'stars', null: false
    t.jsonb 'data', default: {}
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'series', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.string 'genre'
    t.integer 'seasons_count'
    t.date 'release_date'
    t.string 'country'
    t.jsonb 'data', default: {}
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
    t.string 'name', null: false
    t.jsonb 'data', default: {}
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end

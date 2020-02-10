# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200210210159) do

  create_table "shows", force: :cascade do |t|
    t.string "title"
    t.string "actors"
    t.string "directors"
    t.text   "plot"
    t.float  "rating"
    t.string "genre"
    t.string "network"
    t.date   "start_date"
    t.date   "end_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "username"
    t.string "password"
    t.string "country"
  end

  create_table "watchlist", force: :cascade do |t|
    t.integer "user_id"
    t.integer "show_id"
  end

end

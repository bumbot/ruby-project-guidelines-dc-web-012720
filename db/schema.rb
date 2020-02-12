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

ActiveRecord::Schema.define(version: 20200212151914) do

  create_table "genres", force: :cascade do |t|
    t.string "genre"
  end

  create_table "networks", force: :cascade do |t|
    t.string "name"
  end

  create_table "show_genres", force: :cascade do |t|
    t.integer "show_id"
    t.integer "genre_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string  "title"
    t.text    "plot"
    t.float   "rating"
    t.string  "genre"
    t.integer "runtime"
    t.integer "network_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "fullname"
    t.string  "username"
    t.string  "password"
    t.string  "country"
    t.boolean "status"
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "show_id"
  end

end

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

ActiveRecord::Schema.define(version: 20160729154208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "speeches", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "audio_file_name"
    t.string   "audio_content_type"
    t.integer  "audio_file_size"
    t.datetime "audio_updated_at"
<<<<<<< HEAD
    t.text     "summarized_text"
=======
    t.text     "summarized_text",    limit: 65535
    t.text     "key_points",         limit: 65535
>>>>>>> f94a9d23a5dcf49792d004f6e20d10e5ea747d37
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "access_token"
    t.boolean  "is_active",          default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

end

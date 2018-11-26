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

ActiveRecord::Schema.define(version: 2018_11_26_104118) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fundraising_events", force: :cascade do |t|
    t.string "course"
    t.bigint "user_id"
    t.date "date_from"
    t.date "date_until"
    t.string "cv"
    t.string "guarantor"
    t.date "payback_from"
    t.date "payback_until"
    t.text "career_goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "loan_length"
    t.integer "price_cents", default: 0, null: false
    t.integer "amount_raised_cents", default: 0, null: false
    t.string "status"
    t.index ["user_id"], name: "index_fundraising_events_on_user_id"
  end

  create_table "loans", force: :cascade do |t|
    t.string "state"
    t.string "funding_event_sku"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "fundraising_event_id"
    t.index ["fundraising_event_id"], name: "index_loans_on_fundraising_event_id"
    t.index ["user_id"], name: "index_loans_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "user_id"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.boolean "lender"
    t.boolean "applicant"
    t.string "name"
    t.text "motivation"
    t.string "linkedin"
    t.string "photo"
    t.string "job"
    t.string "industry"
    t.boolean "agecheck"
    t.text "reasons_for_funding"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "fundraising_events", "users"
  add_foreign_key "loans", "fundraising_events"
  add_foreign_key "loans", "users"
end

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

ActiveRecord::Schema.define(version: 2018_09_12_163636) do

  create_table "employer_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "location"
    t.string "business_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employer_profiles_on_user_id"
  end

  create_table "hunter_profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "industry"
    t.string "location"
    t.string "hours"
    t.float "min_salary"
    t.integer "max_salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hunter_profiles_on_user_id"
  end

  create_table "hunter_profiles_listings", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "hunter_profile_id", null: false
    t.index ["hunter_profile_id", "listing_id"], name: "index_hunter_profiles_listings_on_profile_id_and_listing_id"
  end

  create_table "hunter_profiles_skills", id: false, force: :cascade do |t|
    t.integer "hunter_profile_id", null: false
    t.integer "skill_id", null: false
    t.index ["hunter_profile_id", "skill_id"], name: "index_hunter_profiles_skills_on_hunter_profile_id_and_skill_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "published"
    t.boolean "accepted"
    t.boolean "application"
    t.float "min_salary"
    t.float "max_salary"
    t.string "location"
    t.string "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employer_profile_id"
    t.index ["employer_profile_id"], name: "index_listings_on_employer_profile_id"
  end

  create_table "listings_skills", id: false, force: :cascade do |t|
    t.integer "listing_id", null: false
    t.integer "skill_id", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "industry"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end

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

ActiveRecord::Schema.define(version: 20171021194349) do

  create_table "comments", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "worker_id"
    t.text "contents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_comments_on_customer_id"
    t.index ["worker_id"], name: "index_comments_on_worker_id"
  end

  create_table "complete_works", force: :cascade do |t|
    t.integer "worker_id"
    t.text "calificacion"
    t.text "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["worker_id"], name: "index_complete_works_on_worker_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.date "birth_date"
    t.string "number_card"
    t.string "address"
    t.string "phone_number"
    t.string "user_name", default: "", null: false
    t.string "encrypted_password", default: "$2a$11$okJltYuXsOl/sQTD638ROuyFDN1r0Zq4HwJ3YM1svzze3O4cPbE7a", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "worker_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_payments_on_customer_id"
    t.index ["worker_id"], name: "index_payments_on_worker_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "service_id"
    t.string "article"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha_servicio"
    t.index ["customer_id"], name: "index_requests_on_customer_id"
    t.index ["service_id"], name: "index_requests_on_service_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "date"
    t.integer "worker_id"
    t.integer "customer_id"
    t.integer "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_schedules_on_customer_id"
    t.index ["request_id"], name: "index_schedules_on_request_id"
    t.index ["worker_id"], name: "index_schedules_on_worker_id"
  end

  create_table "services", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.integer "worker_id"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_skills_on_service_id"
    t.index ["worker_id"], name: "index_skills_on_worker_id"
  end

  create_table "supports", force: :cascade do |t|
    t.integer "worker_id"
    t.text "documento_pdf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "document_file_name"
    t.string "document_content_type"
    t.integer "document_file_size"
    t.datetime "document_updated_at"
    t.index ["worker_id"], name: "index_supports_on_worker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.date "birth_date"
    t.string "number_card"
    t.string "address"
    t.string "phone_number"
    t.string "user_name", default: "", null: false
    t.string "card_number"
    t.string "score"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture_file_name"
    t.string "picture_content_type"
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true
  end

end

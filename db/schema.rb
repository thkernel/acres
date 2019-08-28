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

ActiveRecord::Schema.define(version: 20190828070315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "company", null: false
    t.string "subdomain", null: false
    t.boolean "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "app_configs", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_app_configs_on_user_id", unique: true
  end

  create_table "bank_commision_rate_abandonments", force: :cascade do |t|
    t.string "bank_name"
    t.float "current_bank_rate", default: 0.0
    t.float "abandonment_rate", default: 0.0
    t.bigint "credituid"
    t.bigint "excercise_year_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excercise_year_id"], name: "index_bank_commision_rate_abandonments_on_excercise_year_id"
    t.index ["user_id"], name: "index_bank_commision_rate_abandonments_on_user_id", unique: true
  end

  create_table "bank_commission_editions", force: :cascade do |t|
    t.date "date_effet"
    t.string "completed", default: "no"
    t.float "old_value"
    t.float "new_value"
    t.bigint "bank_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_bank_commission_editions_on_bank_id"
    t.index ["user_id"], name: "index_bank_commission_editions_on_user_id"
  end

  create_table "bank_commission_rate_abandonments", force: :cascade do |t|
    t.string "bank_name"
    t.float "current_bank_rate", default: 0.0
    t.float "abandonment_rate", default: 0.0
    t.bigint "credit_identifier"
    t.bigint "excercise_year_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excercise_year_id"], name: "index_bank_commission_rate_abandonments_on_excercise_year_id"
    t.index ["user_id"], name: "index_bank_commission_rate_abandonments_on_user_id"
  end

  create_table "bank_commission_rate_trackers", force: :cascade do |t|
    t.datetime "start_date"
    t.float "old_rate", default: 0.0
    t.float "new_rate", default: 0.0
    t.bigint "bank_id"
    t.bigint "user_id"
    t.string "status", default: "enable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excercise_year_id"
    t.index ["bank_id"], name: "index_bank_commission_rate_trackers_on_bank_id"
    t.index ["excercise_year_id"], name: "index_bank_commission_rate_trackers_on_excercise_year_id"
    t.index ["user_id"], name: "index_bank_commission_rate_trackers_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "commission_percentage", default: 0.0
    t.float "hypoplus_commission_percentage", default: 0.0
    t.float "first_installment", default: 0.0
    t.integer "number_of_dates", default: 0
    t.string "phone"
    t.string "address"
    t.string "slug"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_remaining_days", default: 0
    t.float "company_remaining_commission_rate", default: 0.0
    t.bigint "excercise_year_id"
    t.index ["excercise_year_id"], name: "index_banks_on_excercise_year_id"
    t.index ["user_id"], name: "index_banks_on_user_id"
  end

  create_table "borderaus", force: :cascade do |t|
    t.string "name"
    t.integer "installment"
    t.string "file_name"
    t.string "credit_identifier"
    t.bigint "excercise_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["excercise_year_id"], name: "index_borderaus_on_excercise_year_id"
  end

  create_table "commission_settings", force: :cascade do |t|
    t.float "commission_percentage", default: 0.0
    t.float "hypoplus_commission_percentage", default: 0.0
    t.float "first_installment", default: 0.0
    t.integer "number_of_dates", default: 0
    t.string "slug"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excercise_year_id"
    t.index ["excercise_year_id"], name: "index_commission_settings_on_excercise_year_id"
    t.index ["user_id"], name: "index_commission_settings_on_user_id", unique: true
  end

  create_table "commissions", force: :cascade do |t|
    t.bigint "credit_identifier"
    t.date "production_date"
    t.date "acte_date"
    t.integer "customer_id"
    t.string "notary_name"
    t.string "bank_name"
    t.string "contributor_name"
    t.string "producer_name"
    t.string "company_name"
    t.float "contributor_commission_percentage", default: 0.0
    t.float "contributor_commission", default: 0.0
    t.float "producer_commission_percentage", default: 0.0
    t.float "producer_commission", default: 0.0
    t.float "bank_commission_percentage", default: 0.0
    t.float "bank_commission", default: 0.0
    t.float "company_commission_percentage", default: 0.0
    t.float "company_commission", default: 0.0
    t.float "amount_credit", default: 0.0
    t.float "total_amount", default: 0.0
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excercise_year_id"
    t.index ["excercise_year_id"], name: "index_commissions_on_excercise_year_id"
    t.index ["user_id"], name: "index_commissions_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.string "slug"
    t.string "brand_file_name"
    t.string "brand_content_type"
    t.bigint "brand_file_size"
    t.datetime "brand_updated_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id", unique: true
  end

  create_table "config_options", force: :cascade do |t|
    t.string "app_name"
    t.string "admin_name"
    t.string "admin_email"
    t.string "admin_password"
    t.string "admin_role", default: "Admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_details", force: :cascade do |t|
    t.string "installment_payment"
    t.date "installment_date"
    t.float "commission", default: 0.0
    t.float "cumulative_amount", default: 0.0
    t.string "paid_by_bank", default: "Non"
    t.string "paid_to_contributor_or_producer", default: "Non"
    t.bigint "credit_identifier", null: false
    t.bigint "credit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excercise_year_id"
    t.index ["credit_id"], name: "index_credit_details_on_credit_id"
    t.index ["excercise_year_id"], name: "index_credit_details_on_excercise_year_id"
  end

  create_table "credits", force: :cascade do |t|
    t.bigint "identifier"
    t.date "production_date"
    t.date "acte_date"
    t.integer "customer_id"
    t.integer "bank_id"
    t.float "amount"
    t.string "bank_name"
    t.string "customer_name"
    t.integer "producer_id"
    t.string "producer_name"
    t.integer "contributor_id"
    t.string "contributor_name"
    t.string "notary_name"
    t.string "hypoplus"
    t.float "total_commission_bank"
    t.float "total_commission_producer"
    t.float "total_commission_contributor"
    t.float "total_commission_company"
    t.string "slug"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excercise_year_id"
    t.index ["excercise_year_id"], name: "index_credits_on_excercise_year_id"
    t.index ["user_id"], name: "index_credits_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "gender"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.string "slug"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.bigint "excercise_year_id"
    t.index ["excercise_year_id"], name: "index_customers_on_excercise_year_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "excercise_years", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.string "close_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_excercise_years_on_user_id"
  end

  create_table "first_installment_payment_delay_expireds", force: :cascade do |t|
    t.bigint "credit_identifier"
    t.datetime "expiration_date"
    t.float "first_installment_percentage", default: 0.0
    t.float "installment_amount", default: 0.0
    t.float "credit_amount", default: 0.0
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_first_installment_payment_delay_expireds_on_user_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "logs", force: :cascade do |t|
    t.string "file_name"
    t.float "no_record"
    t.string "error"
    t.boolean "status"
    t.string "slug"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excercise_year_id"
    t.index ["excercise_year_id"], name: "index_logs_on_excercise_year_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "mail_configurations", force: :cascade do |t|
    t.string "host"
    t.string "user_name"
    t.string "password"
    t.string "domain"
    t.string "address"
    t.integer "port"
    t.string "authentication"
    t.boolean "enable_starttls_auto"
    t.boolean "ssl"
    t.string "slug"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mail_configurations_on_user_id", unique: true
  end

  create_table "monthly_payment_delay_expireds", force: :cascade do |t|
    t.bigint "credit_identifier"
    t.datetime "expiration_date"
    t.bigint "installment_identifier"
    t.float "payment_amount", default: 0.0
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_monthly_payment_delay_expireds_on_user_id"
  end

  create_table "notaries", force: :cascade do |t|
    t.string "full_name"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excercise_year_id"
    t.index ["excercise_year_id"], name: "index_notaries_on_excercise_year_id"
    t.index ["user_id"], name: "index_notaries_on_user_id"
  end

  create_table "payment_delays", force: :cascade do |t|
    t.string "first_installment"
    t.integer "monthly_deadlines_before_payment"
    t.string "monthly_installments"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payment_delays_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "slug"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "super_admin_configs", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_commission_editions", force: :cascade do |t|
    t.date "date_effet"
    t.string "completed", default: "no"
    t.float "old_value"
    t.float "new_value"
    t.bigint "commission_setting_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commission_setting_id"], name: "index_user_commission_editions_on_commission_setting_id"
    t.index ["user_id"], name: "index_user_commission_editions_on_user_id"
  end

  create_table "user_commission_rate_trackers", force: :cascade do |t|
    t.datetime "start_date"
    t.float "old_rate"
    t.float "new_rate"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "excercise_year_id"
    t.index ["excercise_year_id"], name: "index_user_commission_rate_trackers_on_excercise_year_id"
    t.index ["user_id"], name: "index_user_commission_rate_trackers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.bigint "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "role", null: false
    t.string "status", default: "enable", null: false
    t.boolean "receives_notifications", default: false
    t.bigint "created_by"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "receives_summaries", default: false
    t.string "slug"
    t.string "identifier"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "app_configs", "users"
  add_foreign_key "bank_commision_rate_abandonments", "excercise_years"
  add_foreign_key "bank_commision_rate_abandonments", "users"
  add_foreign_key "bank_commission_editions", "banks"
  add_foreign_key "bank_commission_editions", "users"
  add_foreign_key "bank_commission_rate_abandonments", "excercise_years"
  add_foreign_key "bank_commission_rate_abandonments", "users"
  add_foreign_key "bank_commission_rate_trackers", "banks"
  add_foreign_key "bank_commission_rate_trackers", "excercise_years"
  add_foreign_key "bank_commission_rate_trackers", "users"
  add_foreign_key "banks", "excercise_years"
  add_foreign_key "banks", "users"
  add_foreign_key "borderaus", "excercise_years"
  add_foreign_key "commission_settings", "excercise_years"
  add_foreign_key "commission_settings", "users"
  add_foreign_key "commissions", "excercise_years"
  add_foreign_key "commissions", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "credit_details", "credits"
  add_foreign_key "credit_details", "excercise_years"
  add_foreign_key "credits", "excercise_years"
  add_foreign_key "credits", "users"
  add_foreign_key "customers", "excercise_years"
  add_foreign_key "customers", "users"
  add_foreign_key "excercise_years", "users"
  add_foreign_key "first_installment_payment_delay_expireds", "users"
  add_foreign_key "logs", "excercise_years"
  add_foreign_key "logs", "users"
  add_foreign_key "mail_configurations", "users"
  add_foreign_key "monthly_payment_delay_expireds", "users"
  add_foreign_key "notaries", "excercise_years"
  add_foreign_key "notaries", "users"
  add_foreign_key "payment_delays", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "user_commission_editions", "commission_settings"
  add_foreign_key "user_commission_editions", "users"
  add_foreign_key "user_commission_rate_trackers", "excercise_years"
  add_foreign_key "user_commission_rate_trackers", "users"
end

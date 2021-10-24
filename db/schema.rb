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

ActiveRecord::Schema.define(version: 2021_10_24_120705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "address_profiles", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_address_profiles_on_address_id"
    t.index ["profile_id"], name: "index_address_profiles_on_profile_id"
  end

  create_table "address_profils", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_address_profils_on_address_id"
    t.index ["profile_id"], name: "index_address_profils_on_profile_id"
  end

  create_table "address_vendors", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_address_vendors_on_address_id"
    t.index ["vendor_id"], name: "index_address_vendors_on_vendor_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "line_1"
    t.string "line_2"
    t.string "country"
    t.string "city"
    t.string "zip"
    t.string "long"
    t.string "lat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "adresses", force: :cascade do |t|
    t.string "name"
    t.string "line_1"
    t.string "line_2"
    t.string "country"
    t.string "city"
    t.string "zip"
    t.string "long"
    t.string "lat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "image"
    t.boolean "activated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "total"
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.decimal "total"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "image"
    t.boolean "activated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["vendor_id"], name: "index_favorites_on_vendor_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "total"
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "reference"
    t.decimal "total"
    t.boolean "paid"
    t.bigint "user_id", null: false
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
    t.index ["vendor_id"], name: "index_orders_on_vendor_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_variant_option_values", force: :cascade do |t|
    t.bigint "product_variant_id", null: false
    t.bigint "product_variant_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_variant_id"], name: "index_product_variant_option_values_on_product_variant_id"
    t.index ["product_variant_option_id"], name: "index_product_variant_option_values_on_product_variant_optionid"
  end

  create_table "product_variant_options", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "product_option_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_variant_options_on_product_id"
    t.index ["product_option_id"], name: "index_product_variant_options_on_product_option_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.decimal "price"
    t.string "sku"
    t.string "image"
    t.integer "quantity"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.boolean "active"
    t.boolean "available"
    t.boolean "validated"
    t.bigint "subcategory_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
    t.index ["vendor_id"], name: "index_products_on_vendor_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_1"
    t.string "phone_2"
    t.string "image"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.boolean "activated"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image"
    t.string "cover"
    t.boolean "online"
    t.string "legal_name"
    t.date "incorporation_date"
    t.date "registration_date"
    t.string "registration_address"
    t.string "registration_number"
    t.boolean "verified"
    t.boolean "activated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "address_profiles", "addresses"
  add_foreign_key "address_profiles", "profiles"
  add_foreign_key "address_profils", "addresses"
  add_foreign_key "address_profils", "profiles"
  add_foreign_key "address_vendors", "addresses"
  add_foreign_key "address_vendors", "vendors"
  add_foreign_key "cart_products", "carts"
  add_foreign_key "cart_products", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "vendors"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "vendors"
  add_foreign_key "product_variant_option_values", "product_variant_options"
  add_foreign_key "product_variant_option_values", "product_variants"
  add_foreign_key "product_variant_options", "product_options"
  add_foreign_key "product_variant_options", "products"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "subcategories"
  add_foreign_key "products", "vendors"
  add_foreign_key "profiles", "users"
  add_foreign_key "subcategories", "categories"
end

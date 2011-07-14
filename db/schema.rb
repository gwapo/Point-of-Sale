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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110713144414) do

  create_table "customers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "email"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", :force => true do |t|
    t.integer  "item_id"
    t.integer  "employee_id"
    t.string   "comment"
    t.string   "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount",      :precision => 10, :scale => 0, :default => 0
  end

  add_index "inventories", ["employee_id"], :name => "index_inventories_on_employee_id"
  add_index "inventories", ["item_id"], :name => "index_inventories_on_item_id"

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "supplier_id"
    t.text     "descriptions"
    t.decimal  "cost_price",    :precision => 10, :scale => 0
    t.decimal  "unit_cost",     :precision => 10, :scale => 0
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reorder_level"
  end

  create_table "sale_items", :force => true do |t|
    t.integer  "sale_id"
    t.integer  "item_id"
    t.string   "quantity_purchased"
    t.decimal  "item_cost_price",    :precision => 10, :scale => 0
    t.decimal  "item_unit_price",    :precision => 10, :scale => 0
    t.integer  "discount_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sale_items", ["item_id"], :name => "index_sale_items_on_item_id"
  add_index "sale_items", ["sale_id"], :name => "index_sale_items_on_sale_id"

  create_table "sales", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.text     "comments"
    t.string   "payment_type"
    t.decimal  "amount",       :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sales_type",                                  :default => false
  end

  create_table "store_configs", :force => true do |t|
    t.string   "company_name"
    t.string   "email"
    t.string   "fax"
    t.string   "phone"
    t.string   "website"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "company_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "address"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

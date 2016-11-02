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

ActiveRecord::Schema.define(version: 20160822234306) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                      null: false
    t.boolean  "visible",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name",                null: false
    t.string   "last_name",                 null: false
    t.string   "email"
    t.string   "phone"
    t.boolean  "visible",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "equipment", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description",                null: false
    t.string   "model",                      null: false
    t.boolean  "visible",     default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "brand_id"
    t.index ["brand_id"], name: "index_equipment_on_brand_id", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "defect",                                                     null: false
    t.string   "serial_number"
    t.text     "observation",    limit: 65535
    t.decimal  "value",                        precision: 10
    t.boolean  "visible",                                     default: true, null: false
    t.datetime "in_progress_at"
    t.datetime "done_at"
    t.datetime "delivered_at"
    t.datetime "closed_at"
    t.datetime "cancelled_at"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "equipment_id",                                               null: false
    t.integer  "customer_id",                                                null: false
    t.integer  "status",                                      default: 0,    null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id", using: :btree
    t.index ["equipment_id"], name: "index_orders_on_equipment_id", using: :btree
  end

end

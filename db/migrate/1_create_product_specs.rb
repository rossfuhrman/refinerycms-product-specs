class CreateProductSpecs < ActiveRecord::Migration
  def up

    create_table "refinery_products_spec_categories", :force => true do |t|
      t.integer  "category_id"
      t.integer  "vendor_id"
      t.integer  "id_from_vendor"
      t.string   "name"
      t.integer  "position"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index :refinery_products_spec_categories, :id

    create_table "refinery_products_spec_values", :force => true do |t|
      t.integer  "vendor_id"
      t.integer  "id_from_vendor"
      t.decimal  "english_value", :precision => 12, :scale => 4
      t.decimal  "metric_value",  :precision => 12, :scale => 4
      t.string   "text_value"
      t.integer  "product_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index :refinery_products_spec_values, :id

    create_table "refinery_products_specs", :force => true do |t|
      t.integer  "refinery_product_id"
      t.integer  "spec_category_id"
      t.integer  "vendor_id"
      t.integer  "id_from_vendor"
      t.string   "name"
      t.string   "kind"
      t.integer  "position"
      t.integer  "priority_sequence"
      t.string   "english_unit"
      t.string   "metric_unit"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index :refinery_products_specs, :id

#    create_table :refinery_products do |t|
#      t.string :title
#      t.text :body
#      t.boolean :draft, default: true
#      t.datetime :published_at
#      t.integer :position
#      t.timestamps
#    end
#    add_index :refinery_products, :id

#    create_table :refinery_products_categories do |t|
#      t.string :title
#      t.integer :position
    #  t.timestamps
    #end
    #add_index :refinery_products_categories, :id

    #create_table :refinery_products_categories_products do |t|
    #  t.integer :products_category_id
    #  t.integer :product_id
    #end
    #add_index :refinery_products_categories_products, [:products_category_id, :product_id], :name => 'index_products_categories_products_on_pc_and_p'

  end

  def down
    if defined?(::Refinery::UserPlugin)
    #  ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-products"})
    end

    if defined?(::Refinery::Page)
    #  ::Refinery::Page.delete_all(:link_url => Refinery::Products.page_path_products_index)
    #  ::Refinery::Page.delete_all(:link_url => Refinery::Products.page_path_products_categories_index)
    end

    drop_table "refinery_products_spec_categories"
    drop_table "refinery_products_spec_values"
    drop_table "refinery_products_specs"
  end

end

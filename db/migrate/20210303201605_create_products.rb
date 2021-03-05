class CreateProducts < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE product_kind AS ENUM ('simple', 'grouped', 'external', 'variable');
      CREATE TYPE product_status AS ENUM ('draft', 'pending', 'private', 'publish');
      CREATE TYPE product_stock_status AS ENUM ('instock', 'outofstock', 'onbackorder');
      CREATE TYPE product_backorders AS ENUM ('no', 'notify', 'yes');
    SQL

    create_table :products, id: :uuid do |t|
      t.timestamps
      t.string :name, null: false
      t.string :slug, null: false
      t.string :description, null: false
      t.string :short_description, null: false
      t.string :sku
      t.string :regular_price, null: false
      t.string :sale_price
      t.string :price
      t.string :purchase_note
      t.string :weight
      t.string :external_url
      t.integer :parent_id
      t.integer :total_sales
      t.integer :download_limit
      t.integer :download_expiry
      t.integer :stock_quantity, null: false
      t.integer :menu_order
      t.integer :rating_count
      t.float :average_rating
      t.boolean :featured, null: false
      t.boolean :on_sale, null: false
      t.boolean :purchasable, null: false
      t.boolean :virtual, null: false
      t.boolean :downloadable, null: false
      t.boolean :manage_stock, null: false
      t.boolean :backorders_allowed, null: false
      t.boolean :backordered, null: false
      t.boolean :sold_individually, null: false
      t.boolean :shipping_required, null: false
      t.boolean :reviews_allowed, null: false
      t.datetime :date_on_sale_from
      t.datetime :date_on_sale_from_gmt
      t.datetime :date_on_sale_to
      t.datetime :date_on_sale_to_gmt
      t.column :kind, :product_kind, default: 'simple'
      t.column :status, :product_status, default: 'publish'
      t.column :stock_status, :product_stock_status, default: 'instock'
      t.column :backorders, :product_backorders, default: 'no'
      t.json :dimensions, null: false, default: {}
      t.json :meta_data, null: false, default: {}
      t.string :related_ids, array: true, default: []
      t.string :upsell_ids, array: true, default: []
      t.string :cross_sell_ids, array: true, default: []
    end

    def down
      drop_table :products

      execute <<-SQL
        DROP TYPE product_kind;
        DROP TYPE product_status;
        DROP TYPE product_stock_status;
        DROP TYPE product_backorders;
      SQL
    end
  end
end

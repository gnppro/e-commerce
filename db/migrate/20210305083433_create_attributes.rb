class CreateAttributes < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE TYPE options_order_by AS ENUM ('name', 'name_number', 'order');
    SQL

    create_table :attributes, id: :uuid do |t|
      t.timestamps
      t.string :name, null: false
      t.string :slug, null: false
      t.string :component, null: false, default: 'select'
      t.integer :position, null: false, unique: true
      t.integer :count, null: false, default: 0
      t.boolean :visible, null: false
      t.boolean :variation, null: false
      t.column :options_order_by, :options_order_by, default: 'order'
    end
  end

  def down
    drop_table :attributes

    execute <<-SQL
      DROP TYPE options_order_by;
    SQL
  end
end

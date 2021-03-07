class CreateOptions < ActiveRecord::Migration[6.1]
  def up
    create_table :options, id: :uuid do |t|
      t.references :attribute, foreign_key: true, type: :uuid
      t.timestamps
      t.string :name, null: false
      t.string :slug, null: false
      t.string :description, default: ''
      t.integer :order, null: false, unique: true
      t.integer :count, default: 0
    end
  end

  def down
    drop_table :options
  end
end

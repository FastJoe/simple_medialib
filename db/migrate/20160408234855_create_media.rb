class CreateMedia < ActiveRecord::Migration
  def up
    create_table :media do |t|
      t.integer :resource_id
      t.string :resource_type
      t.string :name
      t.text :description
      t.text :extra_data
      t.references :user
      t.timestamps null: false
    end
    add_index :media, [:resource_type, :resource_id]
    add_index :media, :user_id
  end

  def down
    drop_table :media
  end
end

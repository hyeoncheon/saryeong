class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :partial, null: false
      t.integer :x, default: 1
      t.integer :y, default: 1
      t.boolean :system, default: true

      t.timestamps
    end
  end
end

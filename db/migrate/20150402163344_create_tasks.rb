class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :placement
      t.text :description
      t.boolean :completed

      t.timestamps null: false
    end
  end
end

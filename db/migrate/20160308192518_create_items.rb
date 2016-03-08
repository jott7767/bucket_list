class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.boolean :completed, default: false
      t.date :goal_dates 
      t.belongs_to :list

      t.timestamps null: false
    end
  end
end

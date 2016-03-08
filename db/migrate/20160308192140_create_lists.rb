class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end

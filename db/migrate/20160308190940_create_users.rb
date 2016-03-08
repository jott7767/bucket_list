class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fist_name, null: false
      t.string :last_name, null: false

      t.timestamps null: false
    end
  end
end

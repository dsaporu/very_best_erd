class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :cusine_id

      t.timestamps

    end
  end
end

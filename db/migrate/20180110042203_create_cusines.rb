class CreateCusines < ActiveRecord::Migration
  def change
    create_table :cusines do |t|
      t.string :name

      t.timestamps

    end
  end
end

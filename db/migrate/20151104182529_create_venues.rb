class CreateVenues < ActiveRecord::Migration
  def up
    create_table :venues do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end

  def down
    drop_table :venues
  end
end

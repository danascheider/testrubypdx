class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :first_name
      t.string :last_name
      t.string :website
      t.string :company

      t.timestamps null: false
    end
  end
end

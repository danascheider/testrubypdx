class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.date :date
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end

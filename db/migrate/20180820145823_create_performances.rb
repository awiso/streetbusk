class CreatePerformances < ActiveRecord::Migration[5.2]
  def change
    create_table :performances do |t|
      t.references :user, foreign_key: true
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.references :genre, foreign_key: true
      t.string :photo
      t.integer :likes

      t.timestamps
    end
  end
end

class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :user, foreign_key: true
      t.references :performance, foreign_key: true

      t.timestamps
    end
  end
end

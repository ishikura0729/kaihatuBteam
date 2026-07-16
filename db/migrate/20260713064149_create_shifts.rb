class CreateShifts < ActiveRecord::Migration[7.1]
  def change
    create_table :shifts do |t|
      t.string :login_id
      t.string :name
      t.date :work_date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

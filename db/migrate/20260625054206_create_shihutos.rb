class CreateShihutos < ActiveRecord::Migration[7.1]
  def change
    create_table :shihutos do |t|
      t.string :login_id
      t.string :name
      t.date :date
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end

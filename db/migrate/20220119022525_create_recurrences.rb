class CreateRecurrences < ActiveRecord::Migration[6.1]
  def change
    create_table :recurrences do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :repeat_interval
      t.date :last_instance

      t.timestamps
    end
  end
end

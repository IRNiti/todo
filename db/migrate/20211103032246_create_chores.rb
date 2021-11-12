class CreateChores < ActiveRecord::Migration[6.1]
  def change
    create_table :chores do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end

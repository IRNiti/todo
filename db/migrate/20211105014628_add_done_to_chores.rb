class AddDoneToChores < ActiveRecord::Migration[6.1]
  def change
    add_column :chores, :done, :boolean
  end
end

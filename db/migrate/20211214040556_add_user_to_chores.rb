class AddUserToChores < ActiveRecord::Migration[6.1]
  def change
    add_reference :chores, :user, foreign_key: true
  end
end

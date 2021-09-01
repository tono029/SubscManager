class AddUserIdToSubs < ActiveRecord::Migration[6.1]
  def change
    add_column :subs, :user_id, :integer
    add_index :subs, :user_id
  end
end

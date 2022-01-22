class AddColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :subs, :period, :string
  end
end

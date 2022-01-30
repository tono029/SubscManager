class AddUrlToSubs < ActiveRecord::Migration[6.1]
  def change
    add_column :subs, :url, :text
  end
end

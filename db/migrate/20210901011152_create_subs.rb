class CreateSubs < ActiveRecord::Migration[6.1]
  def change
    create_table :subs do |t|
      t.string :sub_name
      t.integer :fee

      t.timestamps
    end
  end
end

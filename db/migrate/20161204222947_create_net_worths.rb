class CreateNetWorths < ActiveRecord::Migration
  def change
    create_table :net_worths do |t|
      t.integer :liabilities_id
      t.integer :net_worth_total_id
      t.integer :asset_total_id
      t.integer :user_id

      t.timestamps

    end
  end
end

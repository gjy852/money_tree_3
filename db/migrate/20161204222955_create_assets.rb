class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :asset_type_id
      t.string :asset_value
      t.integer :user_id
      t.integer :net_worth_id

      t.timestamps

    end
  end
end

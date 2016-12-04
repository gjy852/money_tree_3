class CreateLiabilities < ActiveRecord::Migration
  def change
    create_table :liabilities do |t|
      t.integer :liabilities_type_id
      t.string :liabilities_value
      t.integer :net_worth_id
      t.integer :user_id

      t.timestamps

    end
  end
end

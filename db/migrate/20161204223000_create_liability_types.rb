class CreateLiabilityTypes < ActiveRecord::Migration
  def change
    create_table :liability_types do |t|
      t.string :name

      t.timestamps

    end
  end
end

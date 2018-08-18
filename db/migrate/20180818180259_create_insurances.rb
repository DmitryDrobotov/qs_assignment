class CreateInsurances < ActiveRecord::Migration[5.0]
  def change
    create_table :insurances do |t|
      t.references :facility, foreign_key: true
      t.string :type_id
      t.string :type_desc
      t.integer :d_coverage_amount
      t.integer :d_coverage_percentage
      t.integer :d_monthly_fee

      t.timestamps
    end
    add_index :insurances, :type_id
  end
end

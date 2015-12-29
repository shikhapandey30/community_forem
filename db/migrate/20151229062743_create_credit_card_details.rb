class CreateCreditCardDetails < ActiveRecord::Migration
  def change
    create_table :credit_card_details do |t|
      t.integer :subscription_id
      t.string :card_type
      t.string :card_no
      t.integer :ccv
      t.string :first_name
      t.string :last_name
      t.string :holder_name
      t.integer :exp_month
      t.integer :exp_year

      t.timestamps null: false
    end
  end
end

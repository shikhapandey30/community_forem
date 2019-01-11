class CreatePaypalDetails < ActiveRecord::Migration
  def change
    create_table :paypal_details do |t|

      t.string :express_token
      t.string :express_payer_id
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :zip
      t.timestamps null: false
    end
  end
end

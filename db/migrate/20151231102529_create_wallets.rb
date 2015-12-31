class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.float :amount
      t.integer :walletable_id
      t.string :walletable_type

      t.timestamps null: false
    end
  end
end

class AddColumnsToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :credit_card_number, :integer
    add_column :payments, :expiration_month, :integer
    add_column :payments, :expiration_year, :integer
    add_column :payments, :card_security_code, :integer
  end
end

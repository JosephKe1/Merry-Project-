class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :specialty
      t.string :address
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :clinic

      t.timestamps
    end
  end
end

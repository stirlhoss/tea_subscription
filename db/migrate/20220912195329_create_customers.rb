class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :address

      t.timestamps
    end
  end
end

class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.text :title
      t.integer :price
      t.text :status
      t.integer :frequency

      t.timestamps
    end
  end
end

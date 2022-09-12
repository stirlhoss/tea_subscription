class CreateTeas < ActiveRecord::Migration[7.0]
  def change
    create_table :teas do |t|
      t.text :title
      t.text :description
      t.float :temperature
      t.integer :brew_time

      t.timestamps
    end
  end
end

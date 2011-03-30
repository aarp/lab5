class CreateInventories < ActiveRecord::Migration
  def self.up
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :previous_balance
      t.integer :new_balance
      t.integer :future_balance

      t.timestamps
    end
  end

  def self.down
    drop_table :inventories
  end
end

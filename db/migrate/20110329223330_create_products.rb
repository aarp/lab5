class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.text :title
      t.string :description
      t.string :image_url
      t.decimal :price, {:preciosion => 10, :scale => 2}
      t.integer :projection
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end

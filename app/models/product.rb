class Product < ActiveRecord::Base
  validates_presence_of :title, :description, :price, :image_url
  validates_numericality_of :price, :greater_than => 0.01
  validates_uniqueness_of :title
  validates_format_of :image_url, :with => %r{\.(gif|jpg|png)$}i
  validates_numericality_of :projection, :greater_than => 0

  def
    after_create
    Inventory.new_insert(self.id, self.amount, self.projection)
  end

  def after_update
    i = Inventory.find_by_product_id(self.id)
    i.previous_balance = i.new_balance
    i.new_balance = self.amount
    i.future_balance = self.amount + self.projection
    i.save
  end

  def after_destroy
    i = Inventory.find(self.id)
    i.destroy
  end

end

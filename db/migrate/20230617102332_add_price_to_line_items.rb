class AddPriceToLineItems < ActiveRecord::Migration[7.0]
  def up
    add_column :line_items, :price, :decimal,
               precision: 8, scale: 2
    LineItem.all.each do |l|
      l.price = l.product.price
      l.save!
    end
  end

  def down
    remove_column :line_items, :price
  end
end

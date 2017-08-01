class CreateProducts < ActiveRecord::Migration
	def change
		create_table :products do |t|
			t.integer :brand_id, :null => false 
			t.string :name
			t.float :price
			t.string :description
			t.attachment :product_img
			t.timestamps

		end
		execute 'ALTER TABLE products ADD CONSTRAINT fk_brands_products FOREIGN KEY (brand_id) REFERENCES brands(id) ON DELETE CASCADE'
	end
	
  def self.down
    drop_table :products
  end
end
require 'test_helper'

class ProductTest < ActiveSupport::TestCase

	test "create" do
		product = Product.create(:brand_id => 1,
			:name => 'Ancla', 
			:price => 12.1, 
			:description =>  'holis',
			:product_img =>  '')
		assert product.save
	end

	test "failing_create" do
		product = Product.new
		assert_equal false, product.save
		assert_equal 3, product.errors.count
		assert product.errors[:brand_id]
		assert product.errors[:name]
		assert product.errors[:price]
	end

	test "has_many_and_belongs_to_mapping" do
		brand = Brand.find_by_name("Nauticos");
		count = brand.products.count
		product = Product.create(:brand_id => 1,
			:name => 'Ancla', 
			:price => 12.1, 
			:description =>  'holis',
			:product_img =>  '')

		brand.products << product
		brand.reload
		product.reload
		assert_equal count + 1, brand.products.count
		assert_equal 'Nauticos', product.brand.name

	end

end

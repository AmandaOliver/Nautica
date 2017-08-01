require 'test_helper'

class CatalogBrowseTest < ActionDispatch::IntegrationTest
	test "catalog_browsing" do
		carlos = new_session_as :carlos
		carlos.index
		carlos.second_page
		carlos.product_details 'Ancla Enorme'
		carlos.latest_books
	end

	private
	module CatalogTestDSL
		def index
			get 'catalog/index'
			assert_response :success
			assert_tag :tag => 'dl', :attributes => { :id => 'products' },
			:children => { :count => 5, :only => { :tag => 'dt' }}
			check_product_links
		end

		def check_product_links
			for product in assigns :products
				assert_tag :tag => 'a', :attributes => { :href => "/catalog/show/#{product.id}" }
			end
		end

		def second_page
			get 'catalog/index?page=2'
			assert_response :success
			assert_template 'catalog/index'
			assert_equal Product.find_by_name('Ancla'),
			assigns(:products).last
			check_product_links
		end

		def product_details(name)
			@product = Product.where(:name => name).first
			get "catalog/show/#{@product.id}"
			assert_response :success
			assert_template 'catalog/show'
			assert_tag :tag => 'h1', :content => @product.name
			assert_tag :tag => 'p', :content => @product.description
		end

		def latest_books
			get 'catalog/latest'
			assert_response :success
			assert_template 'catalog/latest'
			assert_tag :tag => 'dl', :attributes => { :id => 'products' },
			:children => { :count => 5, :only => { :tag => 'dt' } }
			@products = Product.latest(5)
			@products.each do |a|
				assert_tag :tag => 'dt', :content => a.name
			end
		end

	end

	def new_session_as(name)
		open_session do |session|
			session.extend(CatalogTestDSL)
			session.name = name
			yield session if block_given?
		end
	end
end
require 'test_helper'

class ProductAdministrationTest < ActionDispatch::IntegrationTest
  
  test "product_aministration" do
    carlos = new_session_as(:carlos)
    new_product = carlos.add_product :product => {
      :brand_id => 1,
      :name => 'Ancla',
      :price => 12.1,
      :description =>  'Ancla en perfectas condiciones',
      :product_img =>  ''
    }

    carlos.list_products
    carlos.show_product new_product

    carlos.edit_product new_product, :product => {
      :brand_id => 2,
      :name => 'Ancla Grande',
      :price => 120.1,
      :description =>  'Excelente ancla grande',
      :product_img =>  ''
    }
    angel = new_session_as(:angel)
    angel.delete_product new_product

  end

  private
  module ProductTestDSL
     def add_product(parameters)
      brand = Brand.first
      get '/admin/product/new'
      assert_response :success
      assert_template 'admin/product/new'
      assert_tag :tag => 'option', :attributes => { :value => brand.id }
      assert_tag :tag => 'select', :attributes => { :name => 'product[brand_id]' }
      post '/admin/product/create', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/product/index'
      page = Product.all.count / 5 + 1
      get "/admin/product/index/?page=#{page}"
      assert_tag :tag => 'td', :content => parameters[:product][:name]
      product = Product.find_by_name(parameters[:product][:name])
      return product;
    end

    def delete_product(product)
      post "/admin/product/destroy?id=#{product.id}"
      assert_response :redirect
      follow_redirect!
      assert_template 'admin/product/index'
    end

    def show_product(product)
      get "/admin/product/show/#{product.id}"
      assert_response :success
      assert_template 'admin/product/show'
    end


    def list_products
      get 'admin/product/index'
      assert_response :success
      assert_template 'admin/product/index'
    end

    def edit_product(product, parameters)
      get "admin/product/edit?id=#{product.id}"
      assert_response :success
      assert_template 'admin/product/edit'
      post "/admin/product/update?id=#{product.id}", parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'admin/product/show'
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(ProductTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end

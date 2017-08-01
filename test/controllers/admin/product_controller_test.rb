require 'test_helper'

class Admin::ProductControllerTest < ActionController::TestCase
  test "should get new product" do
    get :new
    assert_response :success
    assert_tag 'title', :content => 'Añadir producto'
  end

test "should create product" do
  get :new
  assert_difference(Product, :count) do
    post :create, :product => { :brand_id => 1,
                                :name => 'Ancla', 
                                :price => 12.1, 
                                :description =>  'holis',
                                :product_img_file_name =>  'ancla_small.png'}
    assert_response :redirect
    assert_redirected_to :action => 'index'      
  end
  assert_equal 'El producto Ancla fue añadido.', flash[:notice]
end




  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

test "should delete product" do
  assert_difference(Product, :count, -1) do
    post :destroy, :id => 1
    assert_equal flash[:notice], 'El producto Ancla fue eliminado.'
    assert_response :redirect
    assert_redirected_to :action => 'index'
  end
end

  # test "should get show" do
  #   get :show
  #   assert_response :success
  # end

  test "should get index" do
     get :index
     assert_response :success
     assert_tag :tag => 'table', :children => { :count => Product.count + 1, :only => {:tag => 'tr'} }
  end

  # test "should get load_data" do
  #   get :load_data
  #   assert_response :success
  # end

end

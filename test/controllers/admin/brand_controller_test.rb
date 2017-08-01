require 'test_helper'

class Admin::BrandControllerTest < ActionController::TestCase
  test "should create new brand" do
    get :new
    assert_response :success
    assert_tag 'title', :content => 'Añadir marca'

end

test "should create brand" do
  get :new
  assert_difference(Brand, :count) do
    post :create, :brand => {:name => 'Nauticos', 
      :cif => '1213412', 
      :logo_url_file_name => 'holis'}
    assert_response :redirect
    assert_redirected_to :action => 'index'      
  end
  assert_equal 'La marca Nauticos fue añadida.', flash[:notice]
end

test "should show brand" do
  get :show, :id => 1
  assert_template 'admin/brand/show'
  assert_equal 'Nauticos', assigns(:brand).name
  assert_equal 1213412, assigns(:brand).cif
  assert_tag "h1", :content => Brand.find(1).name
end

test "should update brand" do
  post :update, :id => 1, :brand => {:name => 'Adidas', 
    :cif => '1012', 
    :logo_url_file_name => 'adidas_brand.jpg'}
  assert_response :redirect
  assert_redirected_to :action => 'show', :id => 1
  assert_equal 'Adidas', Brand.find(1).name
end

test "should delete brand" do
  assert_difference(Brand, :count, -1) do
    post :destroy, :id => 1
    assert_equal flash[:notice], 'La marca Nauticos fue eliminada.'
    assert_response :redirect
    assert_redirected_to :action => 'index'
  end
end

test "should edit brand" do
  get :edit, :id => 1
  assert_tag :tag => 'input', :attributes => { :name => 'brand[name]', :value => 'Nauticos' }
  assert_tag :tag => 'input', :attributes => { :name => 'brand[cif]', :value => '1213412' }
end

test "should get index" do
  get :index
  assert_response :success
  assert_tag :tag => 'table', :children => { :count => Brand.count + 1, :only => {:tag => 'tr'} }
  Brand.find_each do |a|
    assert_tag :tag => 'td', :content => a.name
  end
end

end

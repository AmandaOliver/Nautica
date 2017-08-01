require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
  assert_response :success
  assert_template 'about/index'
  assert_equal '¿Quiénes somos?', assigns(:page_title)
  assert_tag 'title', :content => '¿Quiénes somos?'
  end

end

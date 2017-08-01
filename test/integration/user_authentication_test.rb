require 'test_helper'

class UserAuthenticationTest < ActionDispatch::IntegrationTest
  def setup
    User.create(:name => 'Carina Wagner', :login => 'carina', :email => 'carina@nauticos.com',
                :password => 'salado', :password_confirmation => 'salado')
  end

  test "should get successful login" do
    george = new_session_as(:george)
    george.tries_to_go_to_admin
    george.logs_in_succesfully("carina", "salado")
  end

  test "should get fallido login" do
    harry = new_session_as(:harry)
    harry.tries_to_go_to_admin
    harry.fails_login("harry", "potter")
  end

  private
  module AuthTestDSL
    include ERB::Util
    attr_writer :name

    def tries_to_go_to_admin
      get '/admin/product/new'
      assert_response :redirect
      assert_redirected_to '/user_sessions/new'
    end

    def logs_in_succesfully(login, password)
      post_login(login, password)
      assert_response :redirect
      assert_redirected_to '/admin/product/new'
    end

    def fails_login(login, password)
      post_login(login, password)
      assert_response :success
      assert_template 'user_sessions/new'
      assert_tag :tag => 'div', :attributes => { :id => 'errorExplanation' }
      assert_tag :tag => 'li', :content => 'Usuario no encontrado'
    end

    private
    def post_login(login, password)
      post '/user_sessions/create', :user_session => { :login => login, :password => password }
    end
  end
  def new_session_as(name)
    open_session do |session|
      session.extend(AuthTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end

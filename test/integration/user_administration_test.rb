require 'test_helper'

class UserBrowsingTest < ActionDispatch::IntegrationTest

  test "should get user account" do
    carlos = new_session_as(:carlos)
    user_account = carlos.creates_user_account(:user => { :name => 'Carlos Contreras', :login => 'carlosc',
                                               :email => 'carlos@nauticos.com', :password => 'oregano',
                                               :password_confirmation => 'oregano' })
    carlos.shows_user_account user_account
    carlos.edits_user_account(user_account, :user => { :name => 'Iván Salguero', :login => 'ivans',
                                            :email => 'ivan@nauticos.com', :password => 'pirmienta',
                                            :password_confirmation => 'pirmienta' })
  end

  private
  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def creates_user_account(parameters)
      user_name = parameters[:user][:name]
      get '/user/new'
      assert_response :success
      assert_template 'user/new'
      assert_tag :tag => 'h1', :content => 'Crear nueva cuenta'
      assert_tag :tag => 'input', :attributes => { :id => 'user_name' }
      post '/user/create', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'user/show'
      assert_tag :tag => 'h1', :content => "#{user_name}"
      assert_equal flash[:notice], "La cuenta #{user_name} ha sido creada. Por favor inicia sesión."
      assert_tag :tag => 'div', :attributes => { :id => 'notice' },
                                :content => "La cuenta #{user_name} ha sido creada. Por favor inicia sesión."
      assert_tag :tag => 'dt', :content => 'Nombre'
      assert_tag :tag => 'dd', :content => user_name
      return User.find_by_login(parameters[:user][:login])
    end

    def shows_user_account(user_account)
      get "/user/show/?id=#{user_account.id}"
      assert_response :success
      assert_template 'user/show'
      assert_tag :tag => 'h1', :content => user_account.name
      assert_tag :tag => 'dt', :content => 'Nombre'
      assert_tag :tag => 'dd', :content => user_account.name
    end

    def edits_user_account(user_account, parameters)
      user = User.find_by_id(user_account.id)
      get "/user/edit?id=#{user.id}"
      assert_response :success
      assert_template 'user/edit'
      assert_tag :tag => 'h1', :content => 'Modificar cuenta'
      assert_tag :tag => 'input', :attributes => { :id => 'user_name' }
      post '/user/update', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'user/show'
      user_name = parameters[:user][:name]
      assert_tag :tag => 'h1', :content => user_name
      assert_equal flash[:notice], "La cuenta #{user_name} ha sido actualizada."
      assert_tag :tag => 'div', :attributes => { :id => 'notice' },
                                :content => "La cuenta #{user_name} ha sido actualizada."
      assert_tag :tag => 'dt', :content => 'Nombre'
      assert_tag :tag => 'dd', :content => user_name
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end

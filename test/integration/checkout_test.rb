require 'test_helper'

class CheckoutTest < ActionDispatch::IntegrationTest
  test "should get empty car error message" do
    get '/checkout'
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal flash[:notice], 'Tu carrito de compras está vacío! Por favor '+
    'añade al menos un producto antes de tramitar tu pedido.'
  end

  test "should submit order" do
    post '/cart/add', :id => 1
    get '/checkout'
    assert_response :success
    assert_tag :tag => 'legend', :content => 'Información de Contacto'
    assert_tag :tag => 'legend', :content => 'Dirección de Envío'
    assert_tag :tag => 'legend', :content => 'Información de Facturación'

    post '/checkout/submit_order', :cart => { :id => Cart.last.id }, :order => {
      # Información de Contacto
      :email => 'carina@nauticos.com',
      :phone_number => '645812712',
      # Dirección de envió
      :ship_to_first_name => 'Carina',
      :ship_to_last_name => 'Wagner',
      :ship_to_address => 'Calle falsa #123',
      :ship_to_city => 'Cádiz',
      :ship_to_postal_code => '11250',
      :ship_to_country_code => 'ES',
      #Información de Facturación
      :card_type => 'Visa',
      :card_number => '4007000000027',
      :card_expiration_month => '3',
      :card_expiration_year => '2018',
      :card_verification_value => '712'

    }

    assert_response :redirect
    assert_redirected_to '/checkout/thank_you'
  end
end

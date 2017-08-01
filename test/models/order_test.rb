require 'test_helper'
require "awesome_print"

class OrderTest < ActiveSupport::TestCase
  test "should create valid order" do
    order = Order.new(
    # Información básica de la orden
    :email => 'carina@nauticos.com',
    :phone_number => '666112233',
    :ship_to_first_name => 'Carina',
    :ship_to_last_name => 'Wagner',
    :ship_to_address => 'Calle Falsa #123',
    :ship_to_city => 'Cádiz',
    :ship_to_postal_code => '11401',
    :ship_to_country_code => 'ES',
    :card_type => 'Visa',
    :card_number => '4007000000027',
    :card_expiration_month => '3',
    :card_expiration_year => '2018',
    :card_verification_value => '182'

    )
    # Añadimos la información privada
    order.customer_ip = '127.0.0.1'
    order.status = 'abierto'
    order.created_at = '2015-05-25 18:37:10'
    order.updated_at = '2015-05-25 18:37:10'

    order.order_items << OrderItem.new(
    :product_id => 1,
    :price => 155.25,
    :amount => 3)

    assert order.save
    assert order.process
    order.reload
    assert_equal 1, order.order_items.size
    assert_equal 155.25, order.order_items[0].price
    assert_equal (155.25*3), order.total
    assert_equal order.status, 'procesado'
    order.close
    assert order.closed?

  end

  test "should get validations" do
    order = Order.new
    assert_equal false, order.save
    assert_equal 16, order.errors.size
    # Un pedido debe contener al menos un producto
    assert order.errors[:order_items]
    # Información de Contacto
    assert order.errors[:email]
    assert order.errors[:phone_number]
    # Dirección de envió
    assert order.errors[:ship_to_first_nane]
    assert order.errors[:ship_to_last_name]
    assert order.errors[:ship_to_address]
    assert order.errors[:ship_to_city]
    assert order.errors[:ship_to_postal_code]
    assert order.errors[:ship_to_country_code]
    #Dirección de Facturación
    assert order.errors[:card_type]
    assert order.errors[:card_number]
    assert order.errors[:card_expiration_month]
    assert order.errors[:card_expiration_year]
    assert order.errors[:card_verification_value]
    # Información Privada
    assert order.errors[:customer_ip]
    assert order.errors[:status]
  end

end

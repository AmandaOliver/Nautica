xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @page_title
    xml.description "The seamanship on rails"
    xml.link url_for :action => 'index', :only_path => false

    for product in @products
      xml.item do
        xml.title product.name
        xml.brand product.brand.name
        xml.description product.description
        xml.price product.price
        xml.link url_for :action => "show", :id => product, :only_path => false
        xml.guid url_for :action => "show", :id => product, :only_path => false

      end
    end
  end
end

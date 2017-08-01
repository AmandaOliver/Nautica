require "awesome_print"

class CatalogController < ApplicationController
  before_filter :initialize_cart
  def index
    @products= Product.order("products.id desc")
    .includes(:brand)
    .paginate(:page => params[:page], :per_page => 5)
    @page_title = 'Catálogo'
  end

  def show
    @product = Product.find(params[:id])
    @page_title = @product.name
  end

  def search
    @products = Product.search(params[:search])
    @page_title = 'Buscar Productos'
  end

  def latest
    @products = Product.latest 5
    @page_title = 'Últimos Productos'
  end

  def rss
    latest
    render :template => 'catalog/rss.rss.builder', :layout => false
  end

end

class Admin::ProductController < Admin::AuthenticatedController
  def new
    load_data
    @product = Product.new
    @page_title = 'Añadir producto'
  end

  def create
    load_data
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "El producto #{@product.name} fue añadido."
      redirect_to :action => 'index'
    else
      @page_title = 'Añadir producto'
      render :action => 'new'
    end
  end

  def edit
    load_data
    @product = Product.find(params[:id])
    @page_title = 'Editar producto'
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:notice] = "El producto #{@product.name} fue actualizado."
      redirect_to :action => 'show', :id => @product
    else
      @page_title = 'Editar producto'
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "El producto #{@product.name} fue eliminado."
    redirect_to :action => 'index'
  end

  def show
    @product = Product.find(params[:id])
    @page_title = @product.name
  end

  def index
    @product = Product.all
    @page_title = 'Lista de productos'
  end

  def load_data
    @brands = Brand.all
  end

  private
  def product_params
    params.require(:product).permit(:brand_id, :name, :price, :description, :product_img)
  end
end

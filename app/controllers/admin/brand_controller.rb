class Admin::BrandController < Admin::AuthenticatedController
  def new
    @brand = Brand.new
    @page_title = 'Añadir marca'
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = "La marca #{@brand.name} fue añadida."
      redirect_to :action => 'index'
    else
      @page_title = 'Añadir Marca'
      render :action => 'new'
    end
  end

  def edit
    @brand = Brand.find(params[:id])
    @page_title = 'Editar marca'
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(brand_params)
      flash[:notice] = "La marca #{@brand.name} fue actualizada."
      redirect_to :action => 'show', :id => @brand
    else
      @page_title = 'Editar marca'
      render :action => 'edit'
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    flash[:notice] = "La marca #{@brand.name} fue eliminada."
    redirect_to :action => 'index'
  end

  def show
    @brand = Brand.find(params[:id])
    @page_title = @brand.name
  end

  def index
    @brand = Brand.all
    @page_title = 'Lista de marcas'
  end

  private
    def brand_params
      params.require(:brand).permit(:name, :cif, :logo_url)
    end

end

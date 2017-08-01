class Admin::OrderController < Admin::AuthenticatedController
  def index
    @status = params[:id]
    if @status.blank?
      @status = ''
      conditions = nil
    else
      conditions = "status = '#{@status}'"
    end
    @orders = Order.where(conditions).paginate(:page => params[:page], :per_page => 10)
    @page_title = @status.blank? ? "Lista de pedidos #{@status}" : "Lista de pedidos #{@status}s"
  end

  def close
    order = Order.find(params[:id])
    order.close
    flash[:notice] = "El pedido ##{order.id} ha sido cerrado."
    redirect_to :action => 'index'
  end

  def show
    @order = Order.find(params[:id])
    @page_title = "Mostrando pedido ##{@order.id}"
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.status == 'cerrado' ||  @order.status == 'fallido'
      @order.destroy
      flash[:notice] = "El pedido #{@order.id} fue eliminado."
      redirect_to :action => 'index'
    else
      flash[:notice] = "No es posible eliminar el pedido #{@order.id} porque aún no se ha cerrado."
      redirect_to :action => 'index'
    end

  end
end

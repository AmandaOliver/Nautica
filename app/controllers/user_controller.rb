class UserController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
    @page_title = 'Crear nueva cuenta'
    if current_user
      flash[:notice] = 'Solo se puede crear una cuenta.'
      redirect_to :controller => 'about', :action => 'index'
    else
      # se me hace raro que la tienda solo permita una cuenta, pero bueno
      redirect_to :controller => 'user_sessions', :action => 'new' unless User.count == 0
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save # usuario identificado
      flash[:notice] = "La cuenta #{@user.name} ha sido creada. Por favor inicia sesión."
      redirect_to :action => 'show'
    else
      @page_title = 'Crear nueva cuenta'
      render :action => :new
    end
  end

  def edit
    @user = current_user
    @page_title = 'Modificar cuenta'
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:notice] = "La cuenta #{@user.name} ha sido actualizada."
      redirect_to :action => 'show'
    else
      @page_title = 'Edit account'
      render :action => 'edit'
    end
  end

  def show
    @user = current_user
    @page_title = @user.name
  end

  private
  def user_params
    params.require(:user).permit(:name, :login, :email, :password, :password_confirmation)
  end
end

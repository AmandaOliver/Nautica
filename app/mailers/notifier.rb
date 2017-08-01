class Notifier < ActionMailer::Base

  default from: 'nauticabarata@gmail.com'
  def password_reset_instructions(user)
    @user = user
    @edit_password_reset_url = url_for(:controller => 'password_resets',
    :action => 'edit',
    :id => user.perishable_token)
    mail(to: @user.email, subject: 'Recuperación de Contraseña')
  end
end

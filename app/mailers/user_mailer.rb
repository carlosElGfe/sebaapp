class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'
 
    def welcome_email
      @user = params[:user]
      @url  = 'http://localhost:3000'
    
      
      mail(to: @user.ident, subject: 'Rush Bakery -Pago realizado, esperando confirmacion')
    end
    def ready_email
      @user = params[:user]
      @url  = 'http://localhost:3000'
    
      
      mail(to: @user.ident, subject: 'Rush Bakery -Pago Confirmado!')
    end
end

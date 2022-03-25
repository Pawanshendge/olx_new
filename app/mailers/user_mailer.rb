class UserMailer < ApplicationMailer
	default from: 'ks2956831@gmail.com'
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  
   def product
    @user = params[:user]
    @product = params[:product]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

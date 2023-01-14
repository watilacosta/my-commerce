class UserMailer < ApplicationMailer
  def confirmation_email_code
    @user = params[:user]
    @confirmation_code = params[:confirmation_code]

    mail(to: @user.email, subject: 'Confirmation code')
  end
end

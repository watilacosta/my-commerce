# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def release_access_code
    @confirmation_code = params[:confirmation_code]

    mail(to: receiver.email, subject: t('mailer.user.confirmation_code'))
  end

  def confirmation_access
    mail(to: receiver.email, subject: t('mailer.user.confirmation_access'))
  end

  private

  def receiver
    @receiver = params[:user]
  end
end

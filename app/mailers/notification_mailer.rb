class NotificationMailer < ApplicationMailer
  default from: 'testingrails93@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.notification_mail.subject
  #
  def notification_mail(usuario)
    @user_mail = usuario
    iden = Proposal.find_by(request_id: @user_mail.id)
    iden_worker = iden.worker_id
    @tec = Worker.find_by(id: iden_worker)
    mail(to: @user_mail.email, subject: 'Tu solicitud ha sido aceptada')
  end
end

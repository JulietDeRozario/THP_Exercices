class AttendanceMailer < ApplicationMailer
  default from: 'amaury.desbazeille@gmail.com'

  def confirm_host(attendance)
    @event = attendance.event
    @participants = @event.users
    @host = @event.host

    mail(to: @host.email, subject: "Inscription à votre événement")
  end
end

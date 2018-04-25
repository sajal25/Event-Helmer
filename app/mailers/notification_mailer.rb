class NotificationMailer < ApplicationMailer

  def welcome_email(user, event)
    @user = user
    @event = event
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Successful Registration on Event Halmer')
  end

  def booking_alert_to_employeer(organizer, user)
    @user = user
    @organizer = organizer
    mail(to: @organizer.email, subject: 'Received booking request successfully.')
  end

  def contact_notification_mailer(contact)
    @contact = contact
    mail(to: @contact.email, subject: "Thank you for contacting Event-Helmar")
  end


end

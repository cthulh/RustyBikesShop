class UserMailer < ApplicationMailer
  def contact_form(_email, name, message)
    @message = message
    @name = name
    mail(
      to: 'tryglavson@hotmail.co.uk',
      subject: "A new contact form message from #{@name}"
    )
  end

  def welcome(user)
    @appname = 'Rusty Bikes'
    mail(
      to: user.email,
      subject: "#{user.first_name}, welcome to #{@appname}!"
    )
  end
end

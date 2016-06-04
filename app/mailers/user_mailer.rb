class UserMailer < ApplicationMailer

	default from: "tryglavson@hotmail.co.uk"

	def contact_form(email, name, message)
		@message = message
		@name = name
		mail(from: email,
			to: "tryglavson@hotmail.co.uk",
			subject: "A new contact form message from #{@name}")
	end
end

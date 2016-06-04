class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
  	@featured_products = Product.first(3)
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	ActionMailer::Base.mail(from: @email,
      to: 'tryglavson@hotmail.co.uk',
      subject: "A new contact form message from #{@name}",
      body: @message).deliver_now
  end
end

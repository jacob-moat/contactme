class ContactMailer < ApplicationMailer
  
  def contact(contact)
    @contact = contact
    @name = @contact.name
    @email = @contact.email
    @message = @contact.message

    mail to: @email, 
    	subject: 'Your Form submission'
  end
end

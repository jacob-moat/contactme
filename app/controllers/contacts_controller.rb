class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]


  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
      if@contact.deliver 
        #ContactMailer.contact(@contact).deliver_now
        flash.now[:error] = nil
      else
        flash.now[:error] = 'Failed to send message.'
        render :new
    end
  end
end
class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contat = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end

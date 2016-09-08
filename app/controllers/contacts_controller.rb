class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new params.require(:contact).permit(:name,
                                                           :email,
                                                           :message)
    if @contact.save
      AnswerMailer.notify_me.deliver_now
      redirect_to contact_path
    else
      render :new
    end
  end
end

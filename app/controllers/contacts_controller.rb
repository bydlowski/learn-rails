class ContactsController < ApplicationController

  # def process_form
  #   Rails.logger.debug "DEBUG: params are #{params}"
  #   flash[:notice] = "Received request from #{params[:contact][:name]}"
  #   redirect_to root_path
  # end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    if @contact.valid?
      UserMailer.contact_email(@contact).deliver_now
      flash[:notice] = "Message sent from #{@contact.name}"
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def secure_params
    # With this code, we make sure that params[:contact] only contains :name, :email, :content. If other parameters are present, they are stripped out.
    params.require(:contact).permit(:name, :email, :content)
  end

end
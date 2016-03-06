class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            # name = params[:contact][:name]
            # email = params[:contact][:email]
            # body = params[:contact][:comments]
      
            # ContactMailer.contact_email(name, email, body).deliver

            
            flash[:success] = "Message sent successfully"
            redirect_to new_contact_path
        else
            flash[:danger] = "Error occurred. Message was not sent."
            redirect_to new_contact_path
        end
    end
    
    # Query String Parameter from the Contact Form
    # Whitewashing the parameters 
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end
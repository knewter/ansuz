class ContactUsController < ApplicationController
	layout 'page'
  model :message

  def index
    @contact_message ||= Message.new
    @contact_whom = Message.contact_whom
		@page = Page.find_by_name 'contact'

		set_layout_variables
  end

  def submit
    @contact_message = Message.new(params[:contact_message])
    if @contact_message.save
      flash[:notice] = 'Your message has been sent'
      redirect_to :action => 'index'
    else
      @contact_whom = Message.contact_whom
      render :action => 'index'
    end
  end

  def resend
  end
end

class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!
  before_action :form_contact, only: [:confirm, :back, :create]
  def new
    @contact = Contact.new
  end

  def confirm
    if @contact.invalid?
      render :new
    end
  end

  def back
    render :new
  end

  def create
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      notification = Notification.new
      notification.contact_id =@contact.id
      notification.save(checked: false)
      flash[:notice] = "お問合せを送りました"
      redirect_to characters_path
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :message)
  end
  def notification_params
    params.require(:notification).permit(:contact_id, :checked)
  end
  def form_contact
     @contact = Contact.new(contact_params)
  end
end
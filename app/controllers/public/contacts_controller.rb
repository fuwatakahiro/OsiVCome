class Public::ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render :new
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def create
    @contact = Contact.new(contact_params)
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
  def notification_params
    params.require(:notification).permit(:contact_id, :checked)
  end
end
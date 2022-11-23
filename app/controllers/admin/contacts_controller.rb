class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!, except: :create
  def index
    @contacts = Contact.page(params[:page]).per(7)
    Notification.confirmed
  end
  def create
    @contact = Contact.find(params[:format])
    notification = Notification.new
    notification.contact_id =@contact.id
    notification.checked = false
    notification.save
    redirect_to characters_path
  end
  private
  def notification_params
    params.require(:notification).permit(:contact_id, :checked)
  end
end

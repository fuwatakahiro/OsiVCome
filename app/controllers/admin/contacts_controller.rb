class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!, except: :create
  def index
    @contacts = Contact.order("created_at  DESC").page(params[:page]).per(7)
    @unchecked_notifications = Notification.where(checked: false)
  end
  def update
    @contacts = Contact.order("created_at  DESC").page(params[:page]).per(7)
    @contact = Contact.find(params[:id])
    @contact.notifications.where(checked: false).update_all(checked: true)
    # redirect_to admin_contacts_path
  end
end
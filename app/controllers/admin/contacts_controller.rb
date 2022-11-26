class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!, except: :create
  def index
    @contacts = Contact.order("created_at  DESC").page(params[:page]).per(7)
    Notification.confirmed
  end
  def update
    @contact = Notification.find(params[:id])
    Notification.confirmed
    redirect_to admin_contacts_path
  end
end

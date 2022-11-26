class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!, except: :create
  def index
    @contacts = Contact.order("created_at  DESC").page(params[:page]).per(7)
  end
  def update
    @contact = Contact.find(params[:id])
    @contact.notifications.where(checked: false).update_all(checked: true)
    redirect_to admin_contacts_path
  end
end

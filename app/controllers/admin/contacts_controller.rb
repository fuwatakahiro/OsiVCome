class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!, except: :create
  def index
    @contacts = Contact.page(params[:page]).per(7)
    Notification.confirmed
  end
end

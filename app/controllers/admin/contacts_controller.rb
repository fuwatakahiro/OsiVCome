class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!, except: :create
  def index
    @contacts = Contact.order("created_at  DESC").page(params[:page]).per(7)
    Notification.confirmed
  end
end

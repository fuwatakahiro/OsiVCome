class Public::ContactsController < ApplicationController
  before_action :authenticate_customer!
  before_action :form_contact, only: [:confirm, :back, :create]
  def index
    @notifications = Notification.where(customer_id: current_customer).order("created_at DESC").page(params[:page])
  end
  def show
    @contact = Contact.find(params[:id])
    @notification = Notification.find_by(contact_id: @contact.id)
  end
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
      notification.customer_id = current_customer.id
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
    params.require(:contact).permit(:title, :message, :customer_id)
  end
  def form_contact
     @contact = Contact.new(contact_params)
  end
end
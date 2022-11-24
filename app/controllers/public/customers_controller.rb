class Public::CustomersController < ApplicationController
  before_action :check_guest, only: [:edit,:update]
  before_action :ensure_correct_customer, only: [:edit, :update]
  
  def index
    @customers = Customer.page(params[:page])
    if params[:rank] == 'desc'
      #TODO: Customer.find_each {|i| Customer.reset_counters(i.id, :comments)}
      @customers =Customer.order('comments_count DESC').page(params[:page])
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
    @comments = @customer.comments.page(params[:page])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]="ユーザー編集しました"
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_deleted, :introduction)
  end
  
  def check_guest
    if current_customer.email == "guest@gmail.com"
     flash[:notice]="ゲストログイン編集できません"
     redirect_to customers_path
    end
  end
  
  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      flash[:notice] = "他のユーザーは編集できません"
      redirect_to customers_path
    end
  end
end

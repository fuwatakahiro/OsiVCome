class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :check_guest, only: [:edit,:update]
  before_action :ensure_correct_customer, only: [:edit, :update]
  before_action :find_customer, only: [:show, :edit, :update]

  def index
    @customers = Customer.page(params[:page])
    if params[:rank] == 'desc'
      #TODO: Customer.find_each {|i| Customer.reset_counters(i.id, :comments)}
      @customers =Customer.order('comments_count DESC').page(params[:page])
    end
  end

  def show
    @comments = @customer.comments.page(params[:page])
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      flash[:notice]="ユーザー編集しました"
      redirect_to customer_path(@customer)
    else
      render "error"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_deleted, :introduction)
  end

  def check_guest
    if current_customer.email == "guest@gmail.com"
     flash[:notice]="ゲストユーザーは編集できません"
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
  def find_customer
    @customer = Customer.find(params[:id])
  end
end

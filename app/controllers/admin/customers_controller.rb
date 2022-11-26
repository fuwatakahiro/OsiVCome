class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :check_customer, only: :edit
  def index
    @customers = Customer.page(params[:page]).per(13)
  end
  def show
    @customer = Customer.find(params[:id])
    @comments = @customer.comments.page(params[:page]).per(5)
  end
  def edit
    @customer = Customer.find(params[:id])
  end
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       flash[:notice] = "ユーザーを更新しました"
       redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_deleted, :profile_image)
  end
  def check_customer
    @customer = Customer.find(params[:id])
    if @customer.email == "guest@gmail.com"
      flash[:notice] = "ゲストユーザーは編集できません"
      redirect_to request.referer
    end
  end
end

class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :find_customer, only: [:show, :edit, :update]
  before_action :check_customer, only: :edit
  def index
    @customers = Customer.order("comments_count DESC").page(params[:page]).per(13)
    
  end
  def show
    @comments = @customer.comments.order("favorites_count DESC").page(params[:page]).per(5)
  end
  def edit
  end
  def update
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
  def find_customer
    @customer = Customer.find(params[:id])
  end
  def check_customer
    @customer = Customer.find(params[:id])
    if @customer.email == "guest@gmail.com"
      flash[:notice] = "ゲストユーザーは編集できません"
      redirect_to request.referer
    end
  end
end

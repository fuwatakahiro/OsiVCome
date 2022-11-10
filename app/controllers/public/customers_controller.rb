class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  def show
    @customer = Customer.find(params[:id])
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
end

class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.all
  end
  def show
    @customer=Customer.find(params[:id])
  end
  def edit
    @customer=Customer.find(params[:id])
  end
  def update
    @customer=Customer.find(params[:id])
     @customer.update!(is_deleted: true)
     reset_session
      flash[:notice] = "ユーザーを更新しました"
      redirect_to admin_customer_path(@customer)
  end
  private
  def cutomer_params
    params.require(:customer).permit(:name,:email, :profile_image, :is_deleted)
  end
end
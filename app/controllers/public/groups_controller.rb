class Public::GroupsController < ApplicationController
  before_action :authenticate_customer!
  before_action :find_character, only:[:join, :destroy, :show]
  def show
    @customers = @group.customers.page(params[:page])
  end

  def join
    @group = Group.find(params[:id])
    if CustomerGroup.find_by(customer_id: current_customer.id)
      flash[:notice] = "最推しは１人までです"
    else
      @group.customers << current_customer
    end
     flash[:notice] = "最推しにしました"
    redirect_to character_path(@character)
  end
  def destroy
    @group.customers.delete(current_customer)
    flash[:notice] = "最推しを解除しました"
    redirect_to character_path(@character)
  end

  private

  def find_character
    @character = Character.find(params[:character_id])
    @group = Group.find(params[:id])
  end
end

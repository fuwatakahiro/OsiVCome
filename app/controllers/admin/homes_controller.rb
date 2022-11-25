class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    redirect_to admin_customers_path
  end
end

class ApplicationController < ActionController::Base
  before_action :check_notifications
  def check_notifications
    @unchecked_notifications = Notification.where(checked:false)
  end
  protected
  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    root_path
  end
end

class ApplicationController < ActionController::Base
  protected
  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    root_path
  end
end

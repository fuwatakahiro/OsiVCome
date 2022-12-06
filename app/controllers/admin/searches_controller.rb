class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    @content = params[:content]
    @model = params[:model]
    if @model == "customer"
      @records = Customer.search_for(@content).page(params[:page]).per(8)
    elsif @model == "character"
      @records = Character.search_for(@content).page(params[:page]).per(8)
    end
  end
end

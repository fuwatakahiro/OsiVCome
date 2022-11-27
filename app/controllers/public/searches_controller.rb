class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    if @model == "character"
      @records = Character.search_for(@content).page(params[:page]).per(8)
    elsif @model == "customer"
      @records = Customer.search_for(@content).page(params[:page]).per(8)
    else
      redirect_to request.referer
    end
  end
end

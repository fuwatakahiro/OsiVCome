class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    if @model == "character"
      @records = Character.search_for(@content)
    elsif @model == "customer"
      @records = Customer.search_for(@content)
    else
      redirect_to request.referer
    end
  end
end

class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @model = params[:model]
    if @model == "character"
      @records = Character.search_for(@content)
    else
      @records = Customer.search_for(@content)
    end
  end
end

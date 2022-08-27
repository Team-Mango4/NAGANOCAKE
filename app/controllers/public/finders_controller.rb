class Public::FindersController < ApplicationController

  def finder
    @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(8)
    @search_word = params[:word]

  end


end

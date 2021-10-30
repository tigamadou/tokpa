class HomeController < ApplicationController
  before_action :set_shop_datas
  def index
  end

  def search
    @product = Product.new
  end

  


  
end

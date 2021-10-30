class HomeController < ApplicationController
  before_action :set_shop_datas
  def index
  end

  def search
    @product = Product.new
    @results = Product.includes([subcategory:[:category]])
    @results = @results.where('products.description LIKE :search OR products.name LIKE :search',  search: "%#{params[:q]}%")
    @results = @results.where(category: {id: params[:category_id]}) if !params[:category_id].nil?
    
    
  end

  


  
end

class CategoriesController < ApplicationController
  before_action :set_category
  
  def index
  end

  def show
    
  end

  private
  def set_category
    @category = Category.includes([subcategories: [:products]]).where("categories.slug = '#{params[:id]}'").references(:subcategories, :products).first
    not_found if @category.nil?
  end
  
end

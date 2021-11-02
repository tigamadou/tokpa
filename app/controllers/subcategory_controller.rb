class SubcategoryController < ApplicationController
  before_action :set_subcategory
  def index
  end

  def show
  end

  private
  def set_subcategory
    @subcategory = Subcategory.includes([:products,:category]).where("subcategories.slug = '#{params[:subcategory]}'").references(:subcategories, :products).first
    not_found if @subcategory.nil?
  end
end

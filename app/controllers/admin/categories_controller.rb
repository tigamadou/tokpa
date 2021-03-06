class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!, :global_admin_role_required
  before_action :set_category, only: %i[ show edit update destroy ]
  layout 'admin'
  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.slug = category_params[:name].parameterize
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_path(@category), notice: "Category was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end

  def update
    respond_to do |format|
      @category.slug = category_params[:name].parameterize
      if @category.update(category_params)
        format.html { redirect_to admin_category_path(@category), notice: "Category was successfully updated." }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_url, notice: "Category was successfully destroyed." }
      
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :slug, :image, :activated)
    end
end

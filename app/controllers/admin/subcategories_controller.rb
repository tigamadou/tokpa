class Admin::SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: %i[ show edit update destroy ]

  def index
    @subcategories = Category.find(params[:category_id]).subcategories
  end

  def show
  end

  def new
    @subcategory = Subcategory.new
  end

  def edit
  end

  def create
    
    @subcategory = Subcategory.new(subcategory_params)
    @subcategory.slug = @subcategory.name.parameterize
    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to admin_subcategory_path(@subcategory), notice: "Subcategory was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @subcategory.slug = subcategory_params[:name].parameterize
      if @subcategory.update(subcategory_params)        
        format.html { redirect_to admin_subcategory_path(@subcategory), notice: "Subcategory was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to admin_category_subcategories_path(@subcategory.category), notice: "Subcategory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_subcategory
      @subcategory = Subcategory.find(params[:id])
    end

    def subcategory_params
      params.require(:subcategory).permit(:name, :activated,:category_id)
    end
end

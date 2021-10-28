class Admin::BrandsController < ApplicationController
  
  before_action :set_brand, only: %i[ show edit update destroy ]

  def index
    @brands = Brand.all
  end

  def show
  end

  def new
    @brand = Brand.new
  end

  def edit
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.slug = brand_params[:name].parameterize
    respond_to do |format|
      if @brand.save
        format.html { redirect_to admin_brand_path(@brand), notice: "Brand was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end

  def update
    respond_to do |format|
      @brand.slug = brand_params[:name].parameterize
      if @brand.update(brand_params)
        format.html { redirect_to admin_brand_path(@brand), notice: "Brand was successfully updated." }
        
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to admin_brands_url, notice: "Brand was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.require(:brand).permit(:name, :slug, :image, :activated)
    end
end

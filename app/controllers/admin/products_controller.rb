class Admin::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
    @vendors = Vendor.all
  end

  def show
  end

  def new
    @product = Product.new
    @vendors = Vendor.all
    @brands = Brand.all
    @subcategories = Subcategory.all
    2.times { @product.product_options.build }
    
  end

  def edit
    @product.product_options.build
  end

  def create
    @product = Product.new(product_params)
    
  
    respond_to do |format|
      @product.slug = product_params[:name].parameterize
      if @product.save
        format.html { redirect_to admin_product_path(@product), notice: "Product was successfully created." }
      else
        @vendors = Vendor.all
        @brands = Brand.all
        @subcategories = Subcategory.all
        
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @product.slug = product_params[:name].parameterize
      if @product.update(product_params)
        format.html { redirect_to admin_product_path(@product), notice: "Product was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: "Product was successfully destroyed." }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(
        :name, :slug, :description, :active, :available, :validated, :subcategory_id, :brand_id, :vendor_id, 
        product_options_attributes: [:id, :product_id, :option_id,:_destroy]
      )
    end
end

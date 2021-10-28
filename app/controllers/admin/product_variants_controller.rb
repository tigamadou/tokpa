class Admin::ProductVariantsController < ApplicationController
  before_action :authenticate_user!, :global_admin_role_required
  before_action :set_product_variant, only: %i[ show edit update destroy ]

  def index
    @variants = ProductVariant.all
  end

  def show
  end

  def new
    @variant = ProductVariant.new
    @product = Product.find(params[:product_id])
    @product.product_options.each do |production_option|
      @variant.product_variant_options.build([product_option_id: production_option.id])
    end
    # byebug
  end

  def edit
    @product = Product.find(params[:product_id])
       
  end

  def create
    @variant = ProductVariant.new(product_variant_params)

    respond_to do |format|
      if @variant.save
        format.html { redirect_to admin_product_variant_path(@variant.product, @variant) , notice: "Product variant was successfully created." }
      else
        format.html { redirect_to new_admin_product_variants_path, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product = Product.find(params[:product_id])
    respond_to do |format|
      @variant.product_variant_options.delete_all
      if @variant.update(product_variant_params)
        format.html { redirect_to admin_product_variant_path(@variant.product, @variant), notice: "Product variant was successfully updated." }
      else
        
   
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @variant.destroy
    respond_to do |format|
      format.html { redirect_to admin_product_variants_url, notice: "Product variant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product_variant
      @variant = ProductVariant.find(params[:id])
    end

    def product_variant_params
      params.require(:product_variant).permit(:price, :sku, :image, :quantity, :product_id, product_variant_options_attributes: [:product_option_id, :value,:_destroy])
    end
end

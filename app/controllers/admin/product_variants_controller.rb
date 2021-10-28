class Admin::ProductVariantsController < ApplicationController
  before_action :set_product_variant, only: %i[ show edit update destroy ]

  def index
    @variants = ProductVariant.all
  end

  def show
  end

  def new
    @variant = ProductVariant.new
  end

  def edit
  end

  def create
    @variant = ProductVariant.new(product_variant_params)

    respond_to do |format|
      if @variant.save
        format.html { redirect_to admin_product_variant_path(@variant.product, @variant) , notice: "Product variant was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
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
      params.require(:product_variant).permit(:price, :sku, :image, :quantity, :product_id)
    end
end

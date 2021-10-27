class Admin::ProductVariantsController < ApplicationController
  before_action :set_product_variant, only: %i[ show edit update destroy ]

  def index
    @product_variants = ProductVariant.all
  end

  def show
  end

  def new
    @product_variant = ProductVariant.new
  end

  def edit
  end

  def create
    @product_variant = ProductVariant.new(product_variant_params)

    respond_to do |format|
      if @product_variant.save
        format.html { redirect_to @product_variant, notice: "Product variant was successfully created." }
        format.json { render :show, status: :created, location: @product_variant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_variant.update(product_variant_params)
        format.html { redirect_to @product_variant, notice: "Product variant was successfully updated." }
        format.json { render :show, status: :ok, location: @product_variant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_variant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_variant.destroy
    respond_to do |format|
      format.html { redirect_to product_variants_url, notice: "Product variant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product_variant
      @product_variant = ProductVariant.find(params[:id])
    end

    def product_variant_params
      params.require(:product_variant).permit(:price, :sku, :image, :quantity, :product_id)
    end
end

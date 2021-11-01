class ProductVariantOptionsController < ApplicationController
  before_action :set_product_variant_option, only: %i[ show edit update destroy ]

  def index
    @product_variant_options = ProductVariantOption.all
  end

  def show
  end

  def new
    @product_variant_option = ProductVariantOption.new
  end

  def edit
  end

  def create
    @product_variant_option = ProductVariantOption.new(product_variant_option_params)

    respond_to do |format|
      if @product_variant_option.save
        format.html { redirect_to @product_variant_option, notice: "Product variant option was successfully created." }
        format.json { render :show, status: :created, location: @product_variant_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_variant_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product_variant_option.update(product_variant_option_params)
        format.html { redirect_to @product_variant_option, notice: "Product variant option was successfully updated." }
        format.json { render :show, status: :ok, location: @product_variant_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_variant_option.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product_variant_option.destroy
    respond_to do |format|
      format.html { redirect_to product_variant_options_url, notice: "Product variant option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_product_variant_option
      @product_variant_option = ProductVariantOption.find(params[:id])
    end

    def product_variant_option_params
      params.require(:product_variant_option).permit(:value, :product_variant_id, :product_option_id)
    end
end

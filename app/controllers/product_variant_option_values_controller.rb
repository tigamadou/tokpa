class ProductVariantOptionValuesController < ApplicationController
  before_action :set_product_variant_option_value, only: %i[ show edit update destroy ]

  # GET /product_variant_option_values or /product_variant_option_values.json
  def index
    @product_variant_option_values = ProductVariantOptionValue.all
  end

  # GET /product_variant_option_values/1 or /product_variant_option_values/1.json
  def show
  end

  # GET /product_variant_option_values/new
  def new
    @product_variant_option_value = ProductVariantOptionValue.new
  end

  # GET /product_variant_option_values/1/edit
  def edit
  end

  # POST /product_variant_option_values or /product_variant_option_values.json
  def create
    @product_variant_option_value = ProductVariantOptionValue.new(product_variant_option_value_params)

    respond_to do |format|
      if @product_variant_option_value.save
        format.html { redirect_to @product_variant_option_value, notice: "Product variant option value was successfully created." }
        format.json { render :show, status: :created, location: @product_variant_option_value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_variant_option_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_variant_option_values/1 or /product_variant_option_values/1.json
  def update
    respond_to do |format|
      if @product_variant_option_value.update(product_variant_option_value_params)
        format.html { redirect_to @product_variant_option_value, notice: "Product variant option value was successfully updated." }
        format.json { render :show, status: :ok, location: @product_variant_option_value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_variant_option_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_variant_option_values/1 or /product_variant_option_values/1.json
  def destroy
    @product_variant_option_value.destroy
    respond_to do |format|
      format.html { redirect_to product_variant_option_values_url, notice: "Product variant option value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_variant_option_value
      @product_variant_option_value = ProductVariantOptionValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_variant_option_value_params
      params.require(:product_variant_option_value).permit(:product_variant_id, :product_variant_option_id)
    end
end

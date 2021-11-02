class CartProductsController < ApplicationController
  before_action :set_cart_product, only: %i[ show edit update destroy ]
  
  def index
    @cart_products = CartProduct.all
  end

  def show
  end

  def new
    @cart_product = CartProduct.new
  end

  def edit
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)

    respond_to do |format|
      if @cart_product.save
        format.html { redirect_to @cart_product, notice: t('defaults.actions.messages.created', model: CartProduct.model_name.human)}
        format.json { render :show, status: :created, location: @cart_product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @cart_product.update(cart_product_params)
        format.html { redirect_to @cart_product, notice: t('defaults.actions.messages.updated', model: CartProduct.model_name.human) }
        format.json { render :show, status: :ok, location: @cart_product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart_product.destroy
    respond_to do |format|
      format.html { redirect_to show_cart_url, notice: t('defaults.actions.messages.destroyed', model: CartProduct.model_name.human) }
      format.json { head :no_content }
    end
  end

  private
    def set_cart_product
      @cart_product = CartProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_product_params
      params.require(:cart_product).permit(:quantity, :total, :cart_id, :product_id)
    end
end

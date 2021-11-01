class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :global_customer_role_required
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :check_profile, :check_vendor
  
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
    
    # redirect_to new_address_path, notice: t('defaults.you_need_a_model',model: Address.model_name.human) if current_user.addresses.count == 0 
  end

  def edit
  end

  def create
    
    
    @order = Order.new(order_params)
    @order.reference = "ORD#{@order.id}"
    
    respond_to do |format|
      if @order.save
        @current_cart.cart_products.each do |cart_product|
          OrderProduct.create(quantity: cart_product.quantity, total: cart_product.product.variants.first.price*cart_product.quantity ,order_id: @order.id, product_id: cart_product.product_id)
        end
        @current_cart.destroy
        format.html { redirect_to orders_path, notice: t('defaults.actions.messages.created', model: Order.model_name.human) }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: t('defaults.actions.messages.created', model: Order.model_name.human) }
      format.json { head :no_content }
    end
  end

  def create_reference
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:reference, :total, :paid, :vendor_id,:user_id)
    end
end

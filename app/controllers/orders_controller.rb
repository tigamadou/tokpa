class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :global_customer_role_required
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :check_profile, :check_vendor
  before_action :check_quantity, only: [:create]

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
    string_length = 8
    @order.reference = "ORD#{rand(36**string_length).to_s(36)}".upcase
    
    respond_to do |format|
      if @order.save
        @current_cart.cart_products.each do |cart_product|
          OrderProduct.create(quantity: cart_product.quantity, total: cart_product.product.variants.first.price*cart_product.quantity ,order_id: @order.id, product_id: cart_product.product_id)
          q = cart_product.product.variants.first.quantity - cart_product.quantity.to_i
          cart_product.product.variants.first.update(quantity: q)
        end
        @current_cart.destroy


        
        format.html { 
          flash[:notice]= t('defaults.actions.messages.created', model: Order.model_name.human)
          flash[:success] = t('defaults.actions.messages.order_created')
          redirect_to orders_path
         }
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

    def check_quantity
      @current_cart.cart_products.each do |cart_product|
        if cart_product.product.variants.first.quantity < cart_product.quantity.to_i
          flash[:alert]= t('defaults.actions.messages.product_not_available_for_order', product: cart_product.product.name)
          redirect_to new_order_path
        end
      end
    end
end

class ApplicationController < ActionController::Base
    before_action :current_cart,:set_shop_datas
    
    def global_admin_role_required
      if !current_user.has_role?(:admin)
        flash[:danger] = "Access denied!." 
        redirect_to root_path
      end
    end

    def global_customer_role_required
      if !current_user.has_role?(:customer)
        flash[:danger] = "Access denied!." 
        redirect_to root_path
      end
    end
   
    

  private
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id].nil?
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
    def set_shop_datas
      @categories = Category.where(activated: true)
      @brands = Brand.where(activated: true)
  end

end

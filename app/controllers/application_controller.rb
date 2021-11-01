class ApplicationController < ActionController::Base
    before_action :current_cart,:set_shop_datas
    before_action :check_session
    
    def global_admin_role_required
      if !current_user.has_role?(:admin) 
        flash[:danger] = t('errors.messages.access_denied')
        redirect_to root_path
      end
    end

    def global_customer_role_required
      if !current_user.has_role?(:customer)
        flash[:danger] = t('errors.messages.ressource_access_denied')
        redirect_to root_path
      end
    end

    def check_profile
      redirect_to new_profile_path, notice:  t('errors.messages.please_set_up_your_profile')  if !current_user.profile
    end
  
    def check_vendor
      redirect_to new_vendor_path if current_user.has_role?(:vendor) && current_user.vendor.nil?
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
      @categories = Category.includes(:subcategories).where(activated: true)
      @brands = Brand.where(activated: true)
    end

    def check_session
      if session[:not_admin] 
        session.delete(:not_admin)
        flash[:danger] = t('errors.messages.ressource_access_denied')
      end

    end

end

class ApplicationController < ActionController::Base

    def global_admin_role_required
        redirect_to root_path if !current_user.has_role?(:admin)
    end
    def set_shop_datas
        @categories = Category.where(activated: true)
    end
end

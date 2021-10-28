class ApplicationController < ActionController::Base

    def global_admin_role_required
        redirect_to root_path if !current_user.has_role?(:admin)
    end
end

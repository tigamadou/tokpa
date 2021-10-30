class SessionController < Devise::SessionsController
    after_action :after_login, :only => :create
    before_action :after_logout, :only => :destroy
    before_action :set_shop_datas
    def after_login        
        current_user.profile.update(online: true) if current_user.profile
        
    end

    def after_logout
        current_user.profile.update(online: false)  if current_user.profile
        
    end
end

class SessionController < Devise::SessionsController
    after_action :after_login, :only => :create
    before_action :after_logout, :only => :destroy
    def after_login
        
        current_user.profile.update(online: true) if current_user.profile
        
    end

    def after_logout
        current_user.profile.update(online: false)  if current_user.profile
        
    end
end

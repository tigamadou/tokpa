class UserController < ApplicationController
	before_action :authenticate_user!
  before_action :check_profile, :check_vendor
  def index
		
    
  end

  private
  def check_profile
    redirect_to new_profile_path, notice: "Please set up your profile."  if !current_user.profile
  end

  def check_vendor
    redirect_to new_vendor_path if current_user.has_role?(:vendor) && current_user.vendor.nil?
  end
end

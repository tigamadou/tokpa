class UserController < ApplicationController
	before_action :authenticate_user!
  def index
		redirect_to new_profile_path, notice: "Please set up your profile."  if !current_user.profile
    redirect_to new_vendor_path if current_user.has_role?(:vendor) && current_user.vendor.nil?
  end
end

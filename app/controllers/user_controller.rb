class UserController < ApplicationController
	before_action :authenticate_user!
  def index
		redirect_to new_profile_path, notice: "Please set up your profile."  if !current_user.profile
  end
end

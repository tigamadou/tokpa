class UserController < ApplicationController
	before_action :authenticate_user!, :global_customer_role_required
  before_action :check_profile, :check_vendor
  def index
  end

  def cart
  end


  
end

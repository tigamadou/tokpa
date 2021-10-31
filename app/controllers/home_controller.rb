class HomeController < ApplicationController
  before_action :set_guest, only: %I[guest_admin guest_user]
  def index
  end

  def search
    @product = Product.new
    @results = Product.includes([subcategory:[:category]])
    @results = @results.where('products.description LIKE :search OR products.name LIKE :search',  search: "%#{params[:q]}%")
    @results = @results.where(category: {id: params[:category_id]}) if !params[:category_id].nil?
    
    
  end

  def guest_user
    @user.add_role(:customer)
    sign_in @user
    redirect_to root_path
  end

  def guest_admin
    @user.add_role(:admin)
    sign_in @user
    redirect_to root_path
  end
  
  private
  def set_guest
      @user =  User.find_by(email: 'guest@tokpa.com')
      unless @user
        @user = User.create!( email: 'guest@tokpa.com', password: '123456789')
      end

      @user.confirm

  end
  
end

class FavoriteController < ApplicationController
    def create
      favorite = current_user.favorites.create(vendor_id: params[:vendor_id])
      flash[:success] = "Added to favorites"
      redirect_to vendor_path favorite.vendor
    end
  
    def destroy
      favorite = current_user.favorites.find_by(id: params[:id])
      vendor = favorite.vendor
      favorite.destroy      
      flash[:primary] = " Unfollowed"
      redirect_to vendor_path vendor
    end
  
   
  end
  
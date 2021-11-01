class FavoriteController < ApplicationController
    def create
      favorite = current_user.favorites.create(vendor_id: params[:vendor_id])
      flash[:success] = t('defaults.actions.messages.created', model: Favorite.model_name.human)
      redirect_to vendor_path favorite.vendor
    end
  
    def destroy
      favorite = current_user.favorites.find_by(id: params[:id])
      vendor = favorite.vendor
      favorite.destroy      
      flash[:primary] =  t('defaults.actions.messages.destroyed', model: Favorite.model_name.human)
      redirect_to vendor_path vendor
    end
  
   
  end
  
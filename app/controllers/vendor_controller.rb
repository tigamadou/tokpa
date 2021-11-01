class VendorController < ApplicationController
  def index
    @vendors = Vendor.includes(:products, image_attachment: :blob,cover_attachment: :blob).where(online: true, verified: true, activated: true)
    # byebug
  end

  def show
    @vendor = Vendor.find(params[:id])
    @favorite = current_user.favorites.find_by(vendor_id: @vendor.id) if user_signed_in?
  end
  private

end

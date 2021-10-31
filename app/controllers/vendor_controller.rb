class VendorController < ApplicationController
  def index
    @vendors = Vendor.where(online: true, verified: true, activated: true).includes(image_attachment: :blob,cover_attachment: :blob);
    # byebug
  end

  def show
    @vendor = Vendor.find(params[:id])
    @favorite = current_user.favorites.find_by(vendor_id: @vendor.id)
  end
  private

end

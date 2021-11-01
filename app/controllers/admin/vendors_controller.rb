class Admin::VendorsController < ApplicationController
  before_action :authenticate_user!, :global_admin_role_required
  before_action :set_vendor, only: %i[ show edit update destroy ]
  def index
    @vendors = Vendor.all
    @users = User.with_role :vendor
  end

  def show
  end

  def new    
    @vendor = Vendor.new
    @users = User.with_role :vendor
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @users = User.with_role :vendor
    respond_to do |format|
      if @vendor.save
        UserVendor.create(user_id: params[:user_id].to_i, vendor_id: @vendor.id)
        format.html { redirect_to admin_vendor_path(@vendor), notice: "Vendor was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to admin_vendor_path(@vendor), notice: "Vendor was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to admin_vendors_url, notice: "Vendor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_vendor
      @vendor = Vendor.find(params[:id])
      @users = User.with_role :vendor
    end

    def vendor_params
      params.require(:vendor).permit(:name, :description, :image, :cover, :online, :legal_name, :incorporation_date, :registration_date, :registration_address, :registration_number, :verified, :activated)
    end

   
end

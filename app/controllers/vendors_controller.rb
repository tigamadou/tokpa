class VendorsController < ApplicationController
  before_action :authenticate_user!, :is_vendor
  before_action :set_vendor, only: %i[ show edit update destroy ]
  def index
    @vendors = Vendor.all
  end

  def show
  end

  def new
    redirect_to user_root_path if current_user.vendor
    @vendor = Vendor.new
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        UserVendor.create(user_id: current_user.id, vendor_id: @vendor.id)
        format.html { redirect_to @vendor, notice: "Vendor was successfully created." }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: "Vendor was successfully updated." }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: "Vendor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  

  private
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params.require(:vendor).permit(:name, :description, :image, :cover, :online, :legal_name, :incorporation_date, :registration_date, :registration_address, :registration_number, :verified, :activated)
    end

    def is_vendor
      redirect_to user_root_path if !current_user.has_role? :vendor
    end
end

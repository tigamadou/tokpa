class AddressesController < ApplicationController
  
  before_action :authenticate_user!, :global_customer_role_required

  before_action :set_address, only: %i[ show edit update destroy ]
  before_action :check_profile, :check_vendor

  def index
    @addresses = current_user.profile.addresses
  end

  def show
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        AddressProfile.create(profile_id: current_user.profile.id, address_id: @address.id)
        
        format.html { redirect_to @address, notice: "Address was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: "Address was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: "Address was successfully destroyed." }
    end
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:name, :line_1, :line_2, :country, :city, :zip, :long, :lat)
    end
end

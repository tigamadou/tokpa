class Admin::OptionsController < ApplicationController
  before_action :authenticate_user!, :global_admin_role_required
  before_action :set_admin_option, only: %i[ show edit update destroy ]

  def index
    @options = Option.all
  end

  def show
  end

  def new
    @option = Option.new
  end

  def edit
  end

  def create
    @option = Option.new(admin_option_params)
    @option.slug = admin_option_params[:name].parameterize
    respond_to do |format|
      if @option.save
        format.html { redirect_to admin_option_path(@option), notice: "Option was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end

  def update
    respond_to do |format|
      @option.slug = admin_option_params[:name].parameterize
      if @option.update(admin_option_params)
        format.html { redirect_to admin_option_path(@option), notice: "Option was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @option.destroy
    respond_to do |format|
      format.html { redirect_to admin_options_url, notice: "Option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_option
      @option = Option.find(params[:id])
    end

    def admin_option_params
      params.require(:option).permit(:name, :slug)
    end
end

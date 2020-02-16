class OrganisationsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

  def index
    @organisation = Organisation.new
    @organisations = Organisation.all
  end

  def show
    redirect_to organisations_path
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      current_user.organisation = @organisation
      current_user.save
      redirect_to root_path, notice: "Organisation was successfully created and you are now a member of #{ @organisation.name }."
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to root_path, notice: 'Organisation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to organisations_url, notice: 'Org was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end
end

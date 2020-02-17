class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def update
    change_user_organisation if params[:organisational_state].present?
    return if params[:organisational_state].present?
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :organisation_id,
      :organisation => [:name, :hourly_rate])
  end

  def change_user_organisation
    @last_organisation = @user.organisation
    @user.organisation_id = params[:organisation_id]
    @user.save
    set_flash_notice
    set_shift_visibility
    redirect_to root_path
  end

  def set_flash_notice
    flash[:notice] = "You have been successfully added to #{@user.organisation.name}!"     if params[:organisational_state] == "joining"
    flash[:notice] = "You have been successfully removed from #{@last_organisation.name}! " if params[:organisational_state] == "leaving"
  end

  def set_shift_visibility
    if @last_organisation.present?
      @user.delete_shifts_from @last_organisation if params[:organisational_state] == "leaving"
    end
    @user.restore_shifts_from  @user.organisation if params[:organisational_state] == "joining"
  end
end

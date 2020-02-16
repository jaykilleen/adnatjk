class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  def edit
    super
  end

  def update
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :organisation_id, :password, :password_confirmation)
  end

end
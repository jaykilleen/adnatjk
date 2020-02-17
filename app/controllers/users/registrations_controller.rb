class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  def edit
    super
  end

  def update
    byebug
    super
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
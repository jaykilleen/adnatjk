class PagesController < ApplicationController

  before_action :force_user_to_join_organisation

  def index
  end

  private

  def force_user_to_join_organisation
    if session.present? && !current_user.organisation.present?
      if flash[:notice].present?
        flash[:notice] = flash[:notice] + "You must become a member of an organisation before you can proceed any further."
      else
        flash[:notice] = "You must become a member of an organisation before you can proceed any further."
      end
      redirect_to organisations_path
    end
  end
end

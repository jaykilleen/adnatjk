class ShiftsController < ApplicationController
  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

  def index
    @shifts = current_user.organisation.all_employee_shifts if !@shifts.present?
    @shift = Shift.new(user_id: current_user.id, organisation_id: current_user.organisation_id) if !@shift.present?
    respond_to do |format|
      format.html { render "pages/index" }
      format.js
    end
  end

  def create
    @shifts = current_user.organisation.all_employee_shifts if !@shifts.present?
    create_shift_from_params
    if @shift.save
      @shifts = current_user.organisation.all_employee_shifts
      redirect_to root_path, notice: "Shift was successfully created."
    else
      error_messages = @shift.errors.full_messages.map { |message| message + ", " }
      flash[:notice] = "#{ (@shift.errors.count.to_s + " error").pluralize } prohibited this shift from being saved. #{ error_messages }."
      render "pages/index"
    end
  end

  def destroy
    @shift.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organisation
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:organisation_id, :date, :start, :finish, :break_length)
  end

  def create_shift_from_params
    @shift = Shift.new
    @shift.user_id = current_user.id
    @shift.organisation = current_user.organisation
    @shift.start  = DateTime.parse(params[:shift][:date] + " " + params[:shift][:start])
    @shift.finish = DateTime.parse(params[:shift][:date] + " " + params[:shift][:finish])
    @shift.break_length = params[:shift][:break_length]
  end

end

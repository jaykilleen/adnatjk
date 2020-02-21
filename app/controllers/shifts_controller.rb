class ShiftsController < ApplicationController
  before_action :set_shift, only: [:show, :edit, :update, :destroy]

  def index
    @shifts = current_user.organisation.all_employee_shifts
    @shifts = current_user.organisation.all_archived_shifts if params[:deleted].present?
    @shift = Shift.new(user_id: current_user.id, organisation_id: current_user.organisation_id) if !@shift.present?
    respond_to do |format|
      format.html { render "pages/index" }
      format.js
      format.json { render json: @shifts }
    end
  end

  def create
    @shifts = current_user.organisation.all_employee_shifts
    create_shift_from_params
    if @shift.save
      @shifts = current_user.organisation.all_employee_shifts
      flash[:notice] = "Shift was successfully created."
    else
      error_messages = @shift.errors.full_messages.map { |message| message + ", " }
      flash[:notice] = "#{ (@shift.errors.count.to_s + " error").pluralize } prohibited this shift from being saved. #{ error_messages }."
    end
    respond_to do |format|
      format.html { render "pages/index" }
      format.js { render "index" }
    end
  end

  def edit
    @shifts = current_user.organisation.all_employee_shifts
    respond_to do |format|
      format.html { render "edit" }
      format.js
    end
  end

  def update
    update_shift_from_params
    respond_to do |format|
      if @shift.save
        format.html { redirect_to root_path, notice: 'Shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift }
      else
        format.html { render :edit, notice: 'Shift failed to save.' }
        format.json { render json: @shift.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shift.destroy
    @shifts = current_user.organisation.all_employee_shifts
    flash[:notice] = "Shift was successfully destroyed."
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Shift was successfully destroyed.' }
      format.js { render "index" }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:organisation_id, :date, :start, :finish, :break_length)
  end

  def create_shift_from_params
    @shift = Shift.new
    @shift.user_id = current_user.id
    @shift.organisation = current_user.organisation
    @finish_date = finish_date params[:date], params[:start], params[:finish]
    @shift.start  = DateTime.parse(params[:date] + " " + params[:start] + "+1000") if params[:date].present? && params[:start].present?
    @shift.finish = DateTime.parse(                         @finish_date+ "+1000") if params[:date].present? && params[:finish].present?
    @shift.break_length = params[:break_length]
  end

  def update_shift_from_params
    @finish_date = finish_date params[:shift][:date], params[:shift][:start], params[:shift][:finish]
    @shift.start  = DateTime.parse(params[:shift][:date] + " " + params[:shift][:start] + "+1000") if params[:shift][:date].present? && params[:shift][:start].present?
    @shift.finish = DateTime.parse(         @finish_date + " " + params[:shift][:finish]+ "+1000") if params[:shift][:date].present? && params[:shift][:finish].present?
    @shift.break_length = params[:shift][:break_length]
  end

  def finish_date date, start, finish
    finish < start ? (date.to_date+1).strftime("%Y-%m-%d") : date
  end

end

class ShiftsController < ApplicationController
  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)

    if @shift.work_date && @shift.start_time && @shift.end_time
      @shift.start_time = @shift.start_time.change(
        year: @shift.work_date.year, 
        month: @shift.work_date.month, 
        day: @shift.work_date.day 
      )
      @shift.end_time = @shift.end_time.change(
        year: @shift.work_date.year, 
        month: @shift.work_date.month, 
        day: @shift.work_date.day 
      )
    end

    if @shift.save
      redirect_to new_shift_path, notice: "シフト登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end
  private 
  def shift_params
    params.require(:shift).permit(
      :login_id, :name, :work_date, :start_time, :end_time
    )
  end
end

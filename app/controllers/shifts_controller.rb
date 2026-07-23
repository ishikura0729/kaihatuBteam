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


  def edit
    @shift = Shift.find(params[:id])
  end

  def update
    @shift = Shift.find(params[:id])
    @shift.assign_attributes(shift_params)
    #日付変更有り無し関わらず日付を登録データに合わせるために新しい情報を持ってくる

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

    if @shift.save(shift_params)
      redirect_to new_shift_path, notice: "変更しました"
    else
      render :edit
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    redirect_to new_shift_path, notice: "削除しました"
  end

  
  private

  def shift_params
    params.require(:shift).permit(
      :login_id, :name, :work_date, :start_time, :end_time
    )
  end
end

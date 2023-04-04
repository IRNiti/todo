class RecurrencesController < ApplicationController

  def show
    @recurrence = Recurrence.find(params[:id])
  end

  def new
    @recurrence = Recurrence.new
  end

  def create
    @recurrence = Recurrence.new(recurrence_params)

    if @recurrence.save
      create_recurring_chores(@recurrence)
      redirect_to @recurrence
    else  
      render :new
    end
    
  end

  def create_recurring_chores(recurrence)
    eow_date = Date.today + (6 - Time.now.wday)
    if recurrence.start_date < eow_date
      chore = recurrence.chores.create(name: recurrence.name, 
                                description: recurrence.description,
                                done: false)
      recurrence.last_instance = recurrence.start_date
      recurrence.save
    end
  end

  private
  def recurrence_params
    params.require(:recurrence).permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :repeat_interval
    )
  end

end
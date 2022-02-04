class ChoresController < ApplicationController

  def index
    @chores_done = Chore.where(done: true)
    @chores_in_progress = Chore.where(done: false)
    @recurring_chores = Recurrence.all
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
    @chore = Chore.new
  end

  def create
    puts chore_params
    @recurring_task
    @chore
    if chore_params[:recurring].eql?('1')
      @chore.recurrence.new
      @recurring_task = Recurrence.new(name: recurrence_params[:name],
                                        description: recurrence_params[:description],
                                        start_date: recurrence_params[:start_date],
                                        end_date: recurrence_params[:end_date],
                                        repeat_interval: recurrence_params[:repeat_interval],
                                        chore: @chore)
    else 
      @chore = Chore.new(chore_params)
    end

    if defined?(@chore) && @chore.save
      redirect_to @chore 
    elsif defined?(@recurring_task) && @recurring_task.save
      redirect_to root_path
    else  
      render :new
    end
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def update 
    @chore = Chore.find(params[:id])

    if @chore.update(chore_params)
      redirect_to @chore
    else
      render :edit
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy

    redirect_to root_path
  end

  private
  def chore_params
    params.require(:chore).permit(
                            :name, 
                            :description, 
                            :done, 
                            :user_id, 
                            :recurring,
                            :start_date,
      :end_date,
      :repeat_interval
                            )
  end

  def recurrence_params
    params.permit(
      :name,
      :description,
      :start_date,
      :end_date,
      :repeat_interval
    )
  end

end

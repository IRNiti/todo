class ChoresController < ApplicationController

  attr_reader :chores_done, :chores_in_progress, :recurring_chores
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
    @chore = Chore.new(chore_params)

    if @chore.save
      redirect_to @chore
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
                            )
  end

end

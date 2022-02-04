class RecurrencesController < ApplicationController

  def show
    @recurrence = Recurrence.find(params[:id])
  end

  def new
    @recurrence = Recurrence.new
  end

  def create
    
  end

end
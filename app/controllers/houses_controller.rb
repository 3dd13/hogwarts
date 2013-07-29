class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.includes(:students).find(params[:id])
    @students = @house.students
  end
end
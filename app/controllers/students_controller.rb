class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def create
    if house_total_count == 0
      redirect_to students_path, notice: "No House Found. Please contact administrator to create a house."
    else
      @student = Student.new(params[:student])
      @student.house_id = random_house_id
      if @student.save
        redirect_to students_path, notice: "Student created successfully. Student has been assigned to #{@student.house.name}"
      else
        render "new"
      end
    end
  end

  def new
    @student = Student.new
  end

  private

  def random_house_id
    rand(1..house_total_count)
  end

  # TODO Rails.cache.fetch("house_counter")
  # TODO expires House after_save
  def house_total_count
    House.count
  end
end
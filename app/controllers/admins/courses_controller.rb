class Admins::CoursesController < ApplicationController
  def index
    @course = Course.new
    @courses = Course.all
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to admins_courses_path
    else
      @courses = Course.all
      render :index
    end
  end

  def edit
    @courses = Course.find(params[:id])
  end

  def updated
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to admins_courses_path
    else
      render :edit
    end
  end

  private
  def course_params
    params.require(:course).permit(:name,:allergy)
  end
end
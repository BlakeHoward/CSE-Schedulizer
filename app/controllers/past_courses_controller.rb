#Jason Kline created this page on 11/28/2016
#
#Modifications made by Jason Kline on 11/30/2016
#Modifications made by Brett Boehmer on 12/1/2016
#Modifications made by Yuzhao Li on 12/1/2016
class PastCoursesController < ApplicationController

  layout "application"
  def edit
    @courses = Course.all
    @past_course = PastCourse.all
  end

  def new
    @add_past_course = PastCourse.create :course_id => params[:course_id], :user_id => params[:user_id]
    redirect_to past_courses_edit_path
  end

  def delete
    @deleted_course = PastCourse.destroy(params[:course_id])
    redirect_to past_courses_edit_path
  end
  private

  def past_course_params
    params.permit(:user_id, :course_id)
  end


end

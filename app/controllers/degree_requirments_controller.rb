#Jason Kline created this page on 11/28/2016
#
#Modifications made by Jason Kline on 11/30/2016
class DegreeRequirmentsController < ApplicationController
  layout "application"
  def find
    @courses = Course.all
    @past_courses = PastCourse.all
    @favorites = Favorite.all
  end
end

#Brett Boehmer created this page on 11/28/2016
#
#Modifications made by Jason Kline on 11/30/2016
#Modifications made by Brett Boehmer on 12/1/2016
class FavoritesController < ApplicationController

  layout 'application'
  def search
      @courses = Course.all
      @favs=4
  end

  def edit
      @courses = Course.all
      @sections = Section.all
      @instructors = Instructor.all
  end

  def new
    @favorite = Favorite.create :section_id => params[:section_id], :user_id => params[:user_id]
    redirect_to "/favorites/edit"
  end

  private

  def favorite_params
    params.permit(:section_id, :user_id)
  end
end

#Jason Kline created this page on 11/29/2016
#Modifications made by Yuzhao Li on 11/30/2016
class Course < ApplicationRecord
  has_many :sections
  has_many :past_courses
  belongs_to :past_course
end

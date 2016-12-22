#Jason Kline created this page on 11/29/2016

class PastCourse < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :course, optional:true
end

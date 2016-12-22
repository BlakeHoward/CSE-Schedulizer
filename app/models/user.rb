#Jason Kline created this page on 11/29/2016
#Modifications made by Yuzhao Li on 11/30/2016

class User < ApplicationRecord
  has_many :favorites
  has_many :past_courses
  attr_accessor :major


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

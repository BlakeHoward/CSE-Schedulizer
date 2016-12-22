#Jason Kline created this page on 11/29/2016
#Modifications made by Yuzhao Li on 11/30/2016
class Favorite < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :section, optional: true
end

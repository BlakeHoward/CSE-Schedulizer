#Jason Kline created this page on 11/28/2016
#
#Modifications made by Jason Kline on 11/30/2016
class ApplicationController < ActionController::Base
  layout "registerLayout"
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end

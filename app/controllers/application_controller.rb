class ApplicationController < ActionController::Base
  protect_from_forgery


  private

  def current_order
    return 1
    #return Adminconfig.first.current_order
  end

  helper_method :current_order


end

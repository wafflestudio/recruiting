class AdminConfig < ActiveRecord::Base
  include Singleton


  attr_accessible :deadline, :current_order
 
  def initialize
    self.deadline = Time.now
  end

  def SetDeadline(time)
    deadline = time
  end


end

class AdminConfig < ActiveRecord::Base
  include Singleton


  attr_accessible :deadline
 
  def initialize
    self.deadline = Time.now
  end



end

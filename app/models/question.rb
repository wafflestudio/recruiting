class Question < ActiveRecord::Base
  attr_accessible :content, :options, :order, :question_type, :priority
  has_one :answer

end

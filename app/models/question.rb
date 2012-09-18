class Question < ActiveRecord::Base
  attr_accessible :content, :options, :order, :question_type
  has_one :answer

end

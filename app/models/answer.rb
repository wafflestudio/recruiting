class Answer < ActiveRecord::Base
  attr_accessible :applicant_id, :content, :question_id
  belongs_to :applicant
  
  belongs_to :question
end

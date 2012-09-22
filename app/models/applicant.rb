class Applicant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

	attr_accessible :name, :phone
  has_many :answers

  scope :in_progress, where("applicants.processed IS NULL")
  scope :complete, where("applicants.processed IS NOT NULL")

  COMPLETE = "complete"
  IN_PROGRESS = "in_progress"

  def process!
    # Doesn't check for the validations
    self.update_attribute('processed', 1)
  end

  def state
   processed.nil? ? IN_PROGRESS : COMPLETE
  end

  # Validations
  validates_presence_of :email, :password, :name, :phone
  validates_uniqueness_of :email
  validates_confirmation_of :password, :on => :create
  validates_length_of :password, :minimum => 4
  
end

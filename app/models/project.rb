class Project < ActiveRecord::Base
  attr_accessible :date_started, :description, :link, :name, :photo, :available_from, :featured

  scope :available, where("available_from < ?", Date.today)
  scope :not_available_yet, where("available_from IS NULL OR available_from > ?", Date.today)
  scope :featured, where("featured = ?", 1)

  
  validates_presence_of :name
  validates_presence_of :description
  
  def make_featured!
    # Doesn't perform the validation checks
    self.update_attribute('featured', 1)
  end


end

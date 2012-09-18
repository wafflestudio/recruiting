class Project < ActiveRecord::Base
  attr_accessible :date_started, :description, :link, :name
end

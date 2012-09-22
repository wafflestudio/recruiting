ActiveAdmin.register Project do

  filter :available_from
  filter :date_started

  scope :all, :default => :true
  scope :available
  scope :not_available_yet
  scope :featured

  index :as => :grid do |project|
    div do
      a :href => admin_project_path(project) do
        image_tag("products/" + project.photo, :height => 115, :width => 115)
      end
    end
    a truncate(project.name), :href => admin_project_path(project)
  end

  action_item :only => [:show, :edit] do
    link_to "Mark as Featured", mark_project_as_featured_path(resource)
  end





end

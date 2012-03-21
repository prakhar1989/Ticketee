class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates_presence_of :title
  validates :description, :presence => true, 
                          :length => { :minimum => 10 }
  has_attached_file :asset
end

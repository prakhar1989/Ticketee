class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :state
  validates_presence_of :title
  validates :description, :presence => true, 
                          :length => { :minimum => 10 }

  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
  
end

class Project < ActiveRecord::Base
  has_many :tickets, :dependent => :delete_all
  validates_presence_of :name
end

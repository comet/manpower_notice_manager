class Paper < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, :description, :presence => true
end

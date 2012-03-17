class Fact < ActiveRecord::Base
  attr_accessor :description
  validates :description, :presence => true
end

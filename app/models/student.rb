class Student < ActiveRecord::Base
  attr_accessible :name, :house_id, :house
  # TODO student name unique ?
  validates :name, :house_id, presence: true

  belongs_to :house
end
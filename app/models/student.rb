class Student < ActiveRecord::Base
  attr_accessible :name, :house_id, :house
  # TODO student name unique ?

  belongs_to :house
end
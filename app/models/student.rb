# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  # Student search when it receives an empty search argument returns all students
  # Student search when it receives a search query returns all students whose names contain the given string

  def self.search(arg)
    if arg.present?
      Student.where("name Like ?", "%#{arg}%")
    else
      self.all 
    end
  end
end

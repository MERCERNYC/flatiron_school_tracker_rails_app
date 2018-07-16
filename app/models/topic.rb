class Topic < ActiveRecord::Base
  has_many :labs
  has_many :students, through: :labs
  accepts_nested_attributes_for :students

  def students_attributes=(student_attributes)
    student_attributes.values.each do |student_attribute|
      student = Student.find_or_create_by(student_attribute)
      self.students << student
    end
  end

end

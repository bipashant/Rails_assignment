class Employee < ActiveRecord::Base

  def update_phoneno val
    self.phone=val
    self.save
    puts "Changed"
  end

  def display_all_employee
    Employee.order(first_name: :asc)
  end


  def display_average_salary
    Employee.average(:salary)
  end
  def display_maximum_salary
    Employee.maximum(:salary)
  end

  def display_minimum_salary
    Employee.minimum(:salary)
  end
  def get_full_name
    "#{self.first_name} #{self.middle_name} #{last_name}"
  end
  def delete_all_records
    Employee.delete_all
  end
end

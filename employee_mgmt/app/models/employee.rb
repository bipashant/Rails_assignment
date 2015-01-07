class Employee < ActiveRecord::Base

 validates :first_name, presence:true
  validates :last_name, presence: true
  validates :phone,allow_blank: true, format: { with: /9[0-9]{9}/,message:"Must have exactly 10 digits number starting with 9"}
 validates :salary, numericality: {greater_than: 0}
 validates :email,uniqueness: true,allow_blank: true, format: { with: /[a-zA-Z]+@[a-z0-9A-Z]+.[.a-zA-Z]+/,message:"%{value}Invalid Email ID"}

 after_validation(on: :create) do
   self.first_name=self.first_name.capitalize
   if(self.middle_name)
      self.middle_name=self.middle_name.capitalize
   end
   self.last_name=self.last_name.capitalize

 end

before_destroy :ask_user_for_delete_confirmation




 def ask_user_for_delete_confirmation
   puts "Are you sure to delete data?(Y/N)"
   input = gets.chomp()
   if !(input == 'y')
     puts "Record not deleted"
     return false

   end
 end


 def update_phoneno val
    self.phone=val
    self.save
  end

  def self.display_all_employee
    Employee.order(first_name: :asc)
  end


  def self.display_average_salary
    Employee.average(:salary)
  end
  def self.display_maximum_salary
    Employee.maximum(:salary)
  end

  def self.display_minimum_salary
    Employee.minimum(:salary)
  end
  def get_full_name
    "#{self.first_name} #{self.middle_name} #{last_name}"
  end
  def self.delete_all_records
    Employee.delete_all
  end
end

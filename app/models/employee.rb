class Employee < ActiveRecord::Base
    validates_presence_of :employee_name, :employee_id, :message => "can't be empty"
end

class EmployeeService
	def initialize(employee)
		@employee = employee
	end

  def delivery_address
		@employee.name+", "+@employee.address+" , contact: "+@employee.mobile
	end

end
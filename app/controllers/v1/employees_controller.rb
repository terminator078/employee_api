 module V1
 	class EmployeesController < ApplicationController

 		# get all employees
 		def index
 			@employees = Employee.order('created_at')
 			render :index, status: :ok
 		end

 		# get a specific employee
 		def show
 			@employee = Employee.find(params[:id])
 			render :show, status: :ok
 		end

 		# create an employee
 		def create
 			@employee = Employee.new(employee_params)
 			if @employee.save
 				render :show, status: :ok
 			else
 				render json: {status: 'ERROR', data:@employee.errors}, status: :unprocessable_entity
 			end
 		end

 		# update an existing employee
 		def update
 			@employee = Employee.find(params[:id])
 			if @employee.update(employee_params)
 				render :show, status: :ok
 			else
 				render json: {status: 'ERROR', data:@employee.errors}, status: :unprocessable_entity
 			end
 		end

 		# delete an employee
 		def destroy
 			@employee = Employee.find(params[:id])
 			@employee.destroy
 			render :show, status: :ok
 		end
         

        # only permitting specified fields
 		private
 		 def employee_params
 		 	params.permit(:name, :title, :mobile, :address)
 		 end
 	end
 end

class Employee < ApplicationRecord
	validates :name, presence: true
	validates :title, presence: true
	validates :mobile, presence: true
	validates :address, presence: true
end

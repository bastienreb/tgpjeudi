class User < ApplicationRecord
	has_secure_password

	validates :password, presence: true, length: { minimum: 6 }
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :age, presence: true, numericality: { only_integer: true }
	validates :city, presence: true
	validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email adress please" }

	has_many :gossips
	belongs_to :city
end

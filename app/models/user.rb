class User < ApplicationRecord
	has_many :stocks
	
	validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable
	devise	:database_authenticatable, 
  		 	:registerable,
  		 	:rememberable, 
  		 	:trackable, 
  		 	:validatable
end

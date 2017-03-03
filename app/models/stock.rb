class Stock < ApplicationRecord
	belongs_to :user

	validates :name, :unit_price, :interest, :duration,
		presence: {message: 'Field can\'t be blank'}
	validates :unit_price, length: {maximum: 9, message: 'Max length 9 symbols'}
	validates :unit_price, :interest, numericality: {message: 'You can use only numbers'}
	validates :interest, :duration, length: {maximum: 3, message: 'Max length 3 symbols'}
	validates :duration, numericality: { only_integer: true, message: 'You can use only numbers'}
end

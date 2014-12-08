class Movie < ActiveRecord::Base
	belongs_to :users
	validates :title, length: {minimum: 1, maximum:50}
	validates :length, numericality: {greater_than: 0, less_than: 500, only_integer: true}
	validates :release_year, numericality: {greater_than: 1800, less_than: 2100, only_integer: true}
end

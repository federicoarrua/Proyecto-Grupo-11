class Tipo < ActiveRecord::Base
	validates :tipo,
		presence: true,
		uniqueness: true,
		length: {minimum: 2 ,maximum:20}
end

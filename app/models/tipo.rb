class Tipo < ActiveRecord::Base
has_many :couches
	validates :tipo,
		presence: true,
		uniqueness: {case_sensitive: false},
		length: {minimum: 2 ,maximum:20}
end

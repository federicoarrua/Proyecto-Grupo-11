class Question < ActiveRecord::Base
	belongs_to :couch
	belongs_to :user

	validates :contenido,
		presence: true,
		length: {minimum: 10 ,maximum: 140}
end

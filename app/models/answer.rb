class Answer < ActiveRecord::Base

	belongs_to :question
	belongs_to :user
	
	validates :contenido,
		presence: true,
		length: {minimum: 10 ,maximum: 140}

end

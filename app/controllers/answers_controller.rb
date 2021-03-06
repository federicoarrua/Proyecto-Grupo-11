class AnswersController < ApplicationController

	def create
		@answer = Answer.new(respuesta_params)
		@answer.user_id = current_user.id
		@answer.save
		@pregunta = Question.find(@answer.pregunta_id)
		if @answer.save
			
			@pregunta.check = true
			@pregunta.save
			redirect_to Couch.find(@pregunta.couch_id)		
		else
			flash[:answer] = "Respuesta muy corta"
			redirect_to Couch.find(@pregunta.couch_id)
		end
	end

	private
		def respuesta_params
			params.require(:answer).permit(:pregunta_id,:contenido)
		end
end

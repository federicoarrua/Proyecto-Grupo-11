class AnswersController < ApplicationController

	def create
		@answer = Answer.new(respuesta_params)
		@answer.user_id = current_user.id
		@answer.save
		if @answer.save
			@pregunta = Question.find(@answer.pregunta_id)
			@pregunta.check = true
			@pregunta.save
			redirect_to Couch.find(@pregunta.couch_id)		
		else
			flash[:answer] = "Respuesta muy corta"
			redirect_to Couch.find(@question.couch_id)
		end
	end

	private
		def respuesta_params
			params.require(:answer).permit(:pregunta_id,:contenido)
		end
end

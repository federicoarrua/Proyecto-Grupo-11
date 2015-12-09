class QuestionsController < ApplicationController
	
	def index
		@question = Question.new
		@question.couch_id = params[:id]
	end

	def new
		@question = Question.new
		@question.couch_id = params[:id]
	end

	def create
		@question = Question.new(pregunta_params)
		@question.user_id = current_user.id
		if @question.save
			redirect_to Couch.find(@question.couch_id)
		else
			flash[:question] = "Pregunta muy corta"
			redirect_to Couch.find(@question.couch_id)
		end
	end

	private
		
		def pregunta_params
			params.require(:question).permit(:couch_id,:contenido)
		end

end

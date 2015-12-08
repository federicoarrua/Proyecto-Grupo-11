class RecoverController < ApplicationController

	def new
			
	end


	def create
		if User.where(email: params[:email][:email]).exists?
			usuario = User.find_by(email: params[:email][:email])
			usuario.password = "12345678"
			usuario.save
			flash[:recover] = "Su nueva contraseña es '12345678'"
			render new_recover_path
		else
			flash[:recover] = "Email incorrecto"
			render new_recover_path
		end
	end
end

class UpuntajesController < ApplicationController

def index
@puntajes=Upuntaje.all

end

def edit
	flash[:id] = params[:id]
	 @upuntaje = Upuntaje.new
end

def create

  @upuntaje = Upuntaje.new(puntaje_params)
  @upuntaje.origen = current_user.id
  @upuntaje.destino = flash[:id]
  @user=User.find(@upuntaje.destino)
  @user.punt=@user.punt + @upuntaje.puntaje
  @user.cant=@user.cant+1
  @user.save
   respond_to do |format|
		if @upuntaje.save
				flash[:update] = "Puntaje hecho."
				format.html { redirect_to root_path }
				
		else
				flash[:id] = @upuntaje.destino
				format.html { render :edit }
				
		end
  end
end

def puntaje_params
params.require(:upuntaje).permit(:puntaje)

end


end

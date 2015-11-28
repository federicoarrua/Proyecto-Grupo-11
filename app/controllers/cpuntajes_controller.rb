class CpuntajesController < ApplicationController


def edit
	flash[:id] = params[:id]
	 @cpuntaje = Cpuntaje.new
end


def create
  @cpuntaje = Cpuntaje.new(puntaje_params)
  @cpuntaje.origen = current_user.id
  @cpuntaje.couch = flash[:id]
  @couch=Couch.find(@cpuntaje.couch)
  @couch.punt=@couch.punt+@cpuntaje.puntaje
  @couch.cant=@couch.cant+1
  @couch.save
   respond_to do |format|
		if @cpuntaje.save
				flash[:update] = "Puntaje hecho."
				format.html { redirect_to root_path }
				
		else
				flash[:id] = @cpuntaje.couch
				format.html { render :edit }
				
		end
  end

end


def puntaje_params
params.require(:cpuntaje).permit(:puntaje)

end

end

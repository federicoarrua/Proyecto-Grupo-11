class ReservasController < ApplicationController

	  before_filter :verify_user

 def index
    @reservas = Reserva.all
  end


def new
   @reservas = Reserva.all
end

def edit
	flash[:id] = params[:id]
	 @reserva = Reserva.new
	 
end

def create
  @reserva = Reserva.new(reserva_params)
  @reserva.nombre_id = current_user.id
  @reserva.couch_id = flash[:id]
  @reserva.estado= "pendiente"
  respond_to do |format|
		if @reserva.save
				flash[:update] = "Reserva hecha."
				format.html { redirect_to reservas_path }
				format.json { render :index, status: :ok, location: @reserva }
		else
				flash[:id] = @reserva.couch_id
				format.html { render :edit }
				format.json { render json: @reserva.errors, status: :unprocessable_entity }
		end
  end
 
  
end

def reserva_params
    params.require(:reserva).permit(:ingreso, :salida)
  end


def update

end

def aceptar
@re=Reserva.find(params[:id])
@re.estado="Aceptado"
@re.save
redirect_to reservas_path

end
def rechazar
@re=Reserva.find(params[:id])
@re.estado="Rechazado"
@re.save
redirect_to reservas_path

end
def cancelar
@re=Reserva.find(params[:id])
@re.estado="Cancelado"
@re.save
redirect_to reservas_path

end

def eliminar
@re=Reserva.find(params[:id])
if @re.estado=="Asistio"
	@re.estado="AsistioE"
else
@re.estado="Eliminado"
end
@re.save
redirect_to reservas_path


end

def asistir
@re=Reserva.find(params[:id])
@re.estado="Asistio"
@re.save
redirect_to reservas_path


end

 private

	def verify_user	
		(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
	end

end

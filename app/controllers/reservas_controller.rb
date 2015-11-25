class ReservasController < ApplicationController

	  before_filter :verify_user

 def index
    @reservas = Reserva.all
  end


def new

end

def edit
	 flash[:id] = params[:id]
end

def create
  @reserva = Reserva.new(reserva_params)
  @reserva.nombre_id = current_user.id
  @reserva.couch_id = flash[:id]
  @reserva.estado= "pendiente"
  @reserva.save
  redirect_to root_path
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
@re.estado="Eliminado"
@re.save
redirect_to reservas_path


end

 private

	def verify_user	
		(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
	end

end

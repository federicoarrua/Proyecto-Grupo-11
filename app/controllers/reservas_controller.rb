class ReservasController < ApplicationController


def new

end

def edit
	 flash[:id] = params[:id]
end

def create
  @reserva = Reserva.new(reserva_params)
  @reserva.nombre_id = current_user.id
  @reserva.couch_id = flash[:id]
  @reserva.save
  redirect_to root_path
end

def reserva_params
    params.require(:reserva).permit(:ingreso, :salida)
  end


def update

end

end

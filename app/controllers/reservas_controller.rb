class ReservasController < ApplicationController


def new
 @reserva
end

def create

  @reserva = Reserva.new(reserva_params)
  @reserva.nombre_id = current_user.id
  @reserva.couch_id = current_couch.id
  @reserva.save
  redirect_to root_path
end
def reserva1_params
    params.require(:reserva).permit(:ingreso, :salida)
  end
def reserva2_params
    params.require(:couch).permit(:id)
  end


def update

end

def edit

end

end

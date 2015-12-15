class CouchesController < ApplicationController
  before_action :set_tipo, only: [:show,:edit,:update]
  
 # before_filter :verify_user

def vista
	@couches = Couch.where(user_id: current_user.id).paginate(page: params[:page], per_page: 2)
end


def index
	@couches = Couch.all.paginate(page: params[:page], per_page: 2)
    if params[:search]
		if params[:search][:ciudad] != ''
      		@couches = @couches.searchCiudad(params[:search][:ciudad]).order("created_at DESC")
		end	
		if params[:search][:capacidad] != ''
      		@couches = @couches.searchCapacidad(params[:search][:capacidad]).order("created_at DESC")
		end
		if params[:search][:tipo] != ''
      		@couches = @couches.searchTipo(params[:search][:tipo]).order("created_at DESC")
		end		
	end
end

def new
	@couch = Couch.new
end



def destroy
  @couch = Couch.find(params[:id])
  @couch.destroy
 
  redirect_to couches_path
end

 

def show  

end



def create
	@couch = Couch.new(couch_params)
	@couch.cant=1
	@couch.punt=5
	@couch.user_id = current_user.id 
    	respond_to do |format|
	  if @couch.save
		flash[:success] = "Couch agregado"
		format.html { redirect_to @couch }
		format.json { render :index, status: :created, location: @couch }
	  else
		format.html { render :new }
		format.json { render json: @couch.errors, status: :unprocessable_entity }
	  end
	end
end

def edit

end



def update

	respond_to do |format|
		if @couch.update(couch_params)
			flash[:update] = "Couch Actualizado."
			format.html { redirect_to @couch }
			format.json { render :index, status: :ok, location: @couch }
		else
			format.html { render :edit }
			format.json { render json: @couch.errors, status: :unprocessable_entity }
		end
	end
end

  
  private
  
	def set_tipo
		@couch = Couch.find(params[:id])
	end
	
	def couch_params
    	params.require(:couch).permit(:descripcion, :capacidad, :tipo_id, :ciudad, :foto)
    end
	
	def verify_user	
		(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
	end

end

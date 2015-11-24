class CouchesController < ApplicationController
  before_action :set_tipo, only: [:show,:edit,:update]
  
  def index
	
	@couches = Couch.where(user_id: current_user.id).paginate(page: params[:page], per_page: 1)
	
  end
def new

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
	@couch.user_id = current_user.id 
 
       @couch.save
       redirect_to @couch
end

def edit
	

  end


def update
 
  if @couch.update(couch_params)
    redirect_to @couch
  else
    render 'edit'
  end
end

  
  private
  
	def set_tipo
		@couch = Couch.find(params[:id])
	end
	
def couch_params
    params.require(:couch).permit(:descripcion, :capacidad, :tipo_id, :ciudad, :foto)
  end
end

class TiposController < ApplicationController	
	before_filter :verify_is_admin
	before_action :set_tipo, only: [ :edit, :update, :destroy]
		
	def index
		@tipo = Tipo.new
	end
	
		def create
		@tipo = Tipo.new(tipo_params)
		
		if Tipo.where(tipo:@tipo.tipo).exists?
			@tipo = Tipo.find_by(tipo:@tipo.tipo)
		end
		@tipo.borrado = false
		respond_to do |format|
		  if @tipo.save
			format.html { redirect_to tipos_path, notice: 'Tipo agregado' }
			format.json { render :index, status: :created, location: @tipo }
		  else
			format.html { render :index }
			format.json { render json: @tipo.errors, status: :unprocessable_entity }
		  end
		end
	end
	
	def edit
	end
	
	def update
		respond_to do |format|
			if @tipo.update(tipo_params)
				format.html { redirect_to tipos_path, notice: 'Tipo Actualizado' }
				format.json { render :index, status: :ok, location: @tipo }
			else
				format.html { render :edit }
				format.json { render json: @tipo.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def destroy
		@tipo.borrado = true
		@tipo.save
		respond_to do |format|
		  format.html { redirect_to tipos_url, notice: 'Tipo eliminado.' }
		  format.json { head :no_content }
		end
	end
	
	private
	
	def set_tipo
		@tipo = Tipo.find(params[:id])
	end

	def tipo_params
      params.require(:tipo).permit(:tipo)
    end
   
	def verify_is_admin
		(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
	end	
 
end

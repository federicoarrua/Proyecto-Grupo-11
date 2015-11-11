class CouchesController < ApplicationController
  before_action :set_tipo, only: [:show]
  
  def index
	@couches = Couch.all.paginate(page: params[:page], per_page: 1)
  end
  
  def show
  end
  
  private
  
	def set_tipo
		@couch = Couch.find(params[:id])
	end
  
end

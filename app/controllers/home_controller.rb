class HomeController < ApplicationController

def index

@couches = Couch.all.paginate(page: params[:page], per_page: 2)

end

end

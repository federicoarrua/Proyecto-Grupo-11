class PremiumController < ApplicationController
	
	before_filter :verify_premium, only: [:index]
	before_filter :verify_nopremium, only: [:new]
	before_filter :verify_user
	
	
	
	def index
	end
	
	def new
	end
	
	def create
		@user = User.find(current_user.id)
		@user.premium = true
		@user.fechaPremium = Date.today
		@user.save
		redirect_to premium_index_path
	end

	def verify_user	
		(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless user_signed_in?)
	end
	
	def verify_premium	
		(!current_user.try(:premium?)) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.try(:premium?))
	end
	
	def verify_nopremium	
		(current_user.try(:premium?)) ? redirect_to(root_path) : (redirect_to(root_path) unless !current_user.try(:premium?))
	end
	
end

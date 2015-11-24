class Couch < ActiveRecord::Base
	belongs_to :tipo
	belongs_to :user
end



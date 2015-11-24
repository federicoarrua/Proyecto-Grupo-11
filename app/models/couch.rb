class Couch < ActiveRecord::Base
	belongs_to :tipo
	belongs_to :user

	attr_accessible :foto
    has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end



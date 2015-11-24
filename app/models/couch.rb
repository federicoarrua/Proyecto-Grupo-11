class Couch < ActiveRecord::Base
	belongs_to :tipo
	belongs_to :user
	
	validates :ciudad,
		presence: true,
		length: {minimum: 2 ,maximum:20}
	
	validates :capacidad,
		presence: true

	has_attached_file :foto, :styles => { :small => "1280x720>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

	validates_attachment_presence :foto
	validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png']
	validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end



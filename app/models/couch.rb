class Couch < ActiveRecord::Base
	belongs_to :tipo
	belongs_to :user
	
	has_many :reservas , dependent: :destroy	
	has_many :questions , dependent: :destroy	

	
	scope :ciudades, -> { order("ciudad") }
	scope :capacidades, -> {order("capacidad") }
	
	validates :descripcion,
		presence: true,
		length: {minimum: 10 ,maximum:140}	
	
	validates :ciudad,
		presence: true,
		length: {minimum: 2 ,maximum:20},
		case_sensitive: false
	
	validates :capacidad,
		presence: true
	
	validates_numericality_of :capacidad, :greater_than => 0	
	
	has_attached_file :foto, :styles => { :original => "1280x720>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

	validates_attachment_presence :foto
	validates_attachment_content_type :foto, :content_type => ['image/jpeg', 'image/png']
	validates_attachment_content_type :foto, :content_type => ["image/jpg", "image/jpeg", "image/png"]

	def self.searchCiudad(query)
	    where("LOWER(ciudad) = ?", "#{query.downcase}") 
	end

	def self.searchCapacidad(query)
	    where("capacidad = ?", "#{query}") 
	end

	def self.searchTipo(query)
	    where("tipo_id = ?", "#{query}") 
	end

end



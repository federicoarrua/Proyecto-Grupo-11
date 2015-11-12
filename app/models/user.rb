class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
	has_many :couchs , dependent: :destroy
	
	validates :nombre,
		presence: true,
		length: {minimum: 2 ,maximum:20}

	validates :apellido,
		presence: true,
		length: {minimum: 2 ,maximum:20}
    
	validates :fecha,
		presence: true

	validate :mayor_18

	def mayor_18
		if self.fecha
		  errors.add(:fecha, 'de nacimiento: Se debe ser mayor de 18 años.') if self.fecha > 18.years.ago.to_date
		end
	end

end

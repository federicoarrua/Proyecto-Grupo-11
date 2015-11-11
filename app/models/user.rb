class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
	has_many :couchs , dependent: :destroy

  validates_length_of :nombre, :minimum => 2
  validates_length_of :apellido, :minimum => 2
  
  validates_length_of :nombre, :maximum => 20
  validates_length_of :apellido, :maximum => 20
  
end

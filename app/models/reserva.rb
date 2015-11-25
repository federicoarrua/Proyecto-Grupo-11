class Reserva < ActiveRecord::Base
# validate :expiration_date_cannot_be_in_the_past
#validates_numericality_of :salida, :greater_than => :ingreso
 validates_datetime :salida, :after => :ingreso
  #def expiration_date_cannot_be_in_the_past
#    errors.add(:salida, "error") if
 #     !salida.blank? and salida < ingreso
#  end

  validates :couch_id,
	presence: true
end

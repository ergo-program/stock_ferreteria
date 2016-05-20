class DMovement < ActiveRecord::Base
  belongs_to :movement
  belongs_to :product
end

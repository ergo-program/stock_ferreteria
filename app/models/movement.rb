class Movement < ActiveRecord::Base
  belongs_to :motive
  belongs_to :person
  has_many :d_movements
end

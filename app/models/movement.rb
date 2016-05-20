class Movement < ActiveRecord::Base
  belongs_to :motive
  belongs_to :person
end

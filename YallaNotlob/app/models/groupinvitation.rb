class Groupinvitation < ApplicationRecord
  belongs_to :Order
  belongs_to :Groupuser
end

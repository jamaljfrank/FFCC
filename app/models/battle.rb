class Battle < ApplicationRecord
  belongs_to :character
  belongs_to :adventure
end

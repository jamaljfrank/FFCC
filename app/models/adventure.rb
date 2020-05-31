class Adventure < ApplicationRecord
  belongs_to :user
  has_many :battles
  has_many :characters, through: :battles

  validates_presence_of :title, :flavor
  validates_uniqueness_of :title, :flavor
end

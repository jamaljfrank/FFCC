class Character < ApplicationRecord
  belongs_to :user
  has_many :battles
  has_many :adventures, through: :battles

  validates :name, presence: true
  validates :tribe, presence: true

  scope :party, ->(user) { where('user_id = ?', user.id) }




end

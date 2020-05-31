class Character < ApplicationRecord
  belongs_to :user
  has_many :battles, dependent: :destroy
  has_many :adventures, through: :battles



  validates_presence_of :name, :tribe


  scope :party, ->(user) { where('user_id = ?', user.id) }




end

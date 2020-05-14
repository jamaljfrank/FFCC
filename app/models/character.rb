class Character < ApplicationRecord
  belongs_to :user
  has_many :battles
  has_many :adventures, through: :battles

  validates :name, presence: true
  validates :tribe, presence: true
  validate :party_of_one, on: :create

  scope :party, ->(user) { where('user_id = ?', user.id) }

  def party_of_one
    if self.user.characters.count > 1
      errors.add(:base, 'Reached character limit')
    end
  end
end

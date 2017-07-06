class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :members
  has_many :users,through: :members
  accepts_nested_attributes_for :members
end

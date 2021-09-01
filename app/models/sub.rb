class Sub < ApplicationRecord
  validates :sub_name, presence: true, uniqueness: true
  validates :fee, presence: true

  belongs_to :user
end

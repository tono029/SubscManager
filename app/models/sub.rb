class Sub < ApplicationRecord
  validates :sub_name, presence: true, uniqueness: true
  validates :fee, presence: true
end

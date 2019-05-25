class List < ApplicationRecord
  belongs_to :board
  has_many :tasks
  validates_presence_of :title

end

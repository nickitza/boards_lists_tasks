class Task < ApplicationRecord
  belongs_to :list
  validates_presence_of :title

end

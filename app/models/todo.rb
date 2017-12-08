class Todo < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?
  belongs_to :project

  validates :text, presence: true, uniqueness: true

  def set_defaults
    self.isCompleted = false if self.isCompleted.nil?
  end
end

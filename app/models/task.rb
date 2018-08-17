class Task < ApplicationRecord
  belongs_to :project

  def completed?
    !completed_at.blank?
  end

  def check_deadline
    self.errors.add('base', 'Deadline is expired') if self.expired?
  end

  def expired?
    self.deadline < Date.today
  end
end

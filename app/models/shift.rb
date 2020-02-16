class Shift < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :organisation
  validates_presence_of :start
  validates_presence_of :finish
  validates_presence_of :break_length

  def length
    ((self.finish - self.start) / 60).to_i
  end

  def hours_worked
    ((self.length - self.break_length)/60.to_f).round(1)
  end

  def cost
    (self.hours_worked * self.organisation.hourly_rate).to_f.round(2)
  end

end

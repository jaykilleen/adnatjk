class Shift < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :organisation
  validates_presence_of :start
  validates_presence_of :finish
  validates_presence_of :break_length
  validates_numericality_of :break_length, greater_than: 0
  validate :break_length_cannot_exceed_shift_length
 
  def break_length_cannot_exceed_shift_length
    if self.length == 0 || (self.break_length > self.length)
      errors.add(:break_length, "Break length cannot be greater than the total shift length.")
    end
  end

  def length
    return 0 if !self.start.present?
    ((self.finish - self.start) / 60).to_i
  end

  def hours_worked
    ((self.length - self.break_length.to_f)/60.to_f).round(1)
  end

  def cost
    hourly_rate = self.organisation.hourly_rate
    cost = (hours_worked * hourly_rate).to_f.round(2)
    if worked_only_on_sunday?
      cost = cost * 2
    elsif worked_part_of_sunday?
      if started_on_a_sunday?
        penalty_hours = [hours_worked_on_sunday, hours_worked].min
        return cost = (penalty_hours * hourly_rate * 2) + ((hours_worked - penalty_hours) * hourly_rate)
      end
      if finished_on_a_sunday?
        
        # If a break exceeds the penalty hours then set it to zero
        penalty_hours = [(hours_worked_on_sunday - (break_length.to_f/60).to_f),0].max
        return cost = (penalty_hours * hourly_rate * 2) + (((length / 60).to_f - hours_worked_on_sunday) * hourly_rate)
      end
    else
      return cost
    end
  end

  private

    def started_on_a_sunday?
      self.start.strftime("%A") == "Sunday"
    end

    def finished_on_a_sunday?
      self.finish.strftime("%A") == "Sunday"
    end

    def worked_only_on_sunday?
      started_on_a_sunday? && finished_on_a_sunday?
    end

    def worked_part_of_sunday?
      return true if started_on_a_sunday? || finished_on_a_sunday?
    end

    def hours_worked_on_sunday
      if started_on_a_sunday?
        return ((( self.finish.midnight - self.start ) / 60)/60).to_f
      end
      if finished_on_a_sunday?
        return ((( self.finish - self.finish.midnight) / 60)/60).to_f
      end
    end
end

class Organisation < ApplicationRecord
  
  validates_uniqueness_of :name, case_sensitive: false
  validates_presence_of :name
  has_many :users
  has_many :shifts, through: :users

  def all_employee_shifts
    all_employee_shifts = []
    Shift.where(organisation_id: self.id).order("finish DESC").each do |shift|
      all_employee_shifts << shift
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_validation :downcase_email
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  
  belongs_to :organisation, optional: true
  accepts_nested_attributes_for :organisation
  has_many :shifts, dependent: :delete_all

  def delete_shifts_from organisation
    shifts = self.shifts.where(organisation_id: organisation.id)
    shifts.each do |shift|
      shift.destroy
    end
  end

  def restore_shifts_from organisation
    if self.shifts.present?
      shifts = self.shifts.only_deleted.where(organisation_id: organisation.id)
      shifts.each do |shift|
        shift.restore
      end
    end
  end

  private
  
    def downcase_email
      self.email = email.downcase if email.present?
    end

end

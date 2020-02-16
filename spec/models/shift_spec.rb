require 'rails_helper'

RSpec.describe Shift, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
    it { should validate_presence_of(:break_length) }
    it { should belong_to(:user) }
    it { should belong_to(:organisation) }
  end

  describe 'shift length' do
    it 'is the total time in minutes between start and finish times' do
      shift = build(:shift)
      expect(shift.length).to eq(480)
    end
  end

  describe 'hours worked' do
    it "is the shift length less the total break time" do
      shift = build(:shift)
      expect(shift.hours_worked).to eq(7.5)
    end
  end

  describe 'shift costs' do
    it "is the organisational hourly rate by the hours worked" do
      organisation = build(:organisation)
      shift = build(:shift)
      expect(shift.cost).to eq(75)
    end
  end
end

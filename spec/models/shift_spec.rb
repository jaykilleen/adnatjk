require 'rails_helper'

RSpec.describe Shift, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:finish) }
    it { should validate_presence_of(:break_length) }
    it { should belong_to(:user) }
    it { should belong_to(:organisation) }
    it { should validate_numericality_of(:break_length).is_greater_than(0) }
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
      shift = build(:shift)
      expect(shift.cost).to eq(75)
    end
  end

  describe "night shifts" do
    it "calculates hours worked when starting in the PM and finishing in the AM" do
      shift = build(:overnight_shift)
      expect(shift.length).to eq(480)
    end
  end

  describe "penalty rates on sunday" do
    it "hourly rates are doubled for the hours completed on a Sunday" do
      shift = build(:sunday_shift)
      expect(shift.cost).to eq(150)
    end

    it "with breaks subtracted from a sunday" do
      shift = build(:saturday_night_shift)
      expect(shift.cost.to_i).to eq(120)
    end

    it "with breaks subtracted from a monday" do
      shift = build(:sunday_night_shift)
      expect(shift.cost.to_i).to eq(105)
    end

    it "with breaks subtracted from a sunday that results in no sunday hours" do
      shift = build(:sunday_night_shift_with_long_break)
      expect(shift.cost.to_i).to eq(30)
    end

    it "with breaks subtracted from a sunday that results in no sunday hours and some lost saturday hours" do
      shift = build(:sunday_night_shift_with_a_comfy_bed)
      expect(shift.cost.to_i).to eq(30)
    end

    # Optional Exercise 6 - Example 1
    it "Sunday 10PM - Monday 3AM" do
      shift = build(:example_one)
      expect(shift.cost.to_i).to eq(60)
    end

    # Optional Exercise 6 - Example 2
    it "Sunday 5PM - Monday 2AM" do
      shift = build(:example_two)
      expect(shift.cost.to_i).to eq(140)
    end

    # Optional Exercise 6 - Example 3
    it "Sunday 9PM - Monday 1AM" do
      shift = build(:example_three)
      expect(shift.cost.to_i).to eq(40)
    end
  end
end

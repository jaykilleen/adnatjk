require 'rails_helper'

RSpec.describe Organisation, type: :model do
  describe 'validations' do

    subject { build(:organisation) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should have_many(:users) }
    it { should have_many(:shifts).through(:users) }
  end
end

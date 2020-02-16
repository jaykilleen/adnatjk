require 'rails_helper'

RSpec.describe ShiftPolicy, type: :policy do
  let(:user) { create(:user) }
  let(:shift) { build(:shift, user: user) }

  subject { described_class.new(user, shift) }

  context "being the shift owner" do
    it { should forbid_action(:index) }
    it { should forbid_action(:show) }
    it { should permit_edit_and_update_actions }
    it { should permit_new_and_create_actions }
    it { should permit_action(:destroy) }
  end
end

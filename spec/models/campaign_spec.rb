# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  subject { create(:campaign) }

  describe 'Associations' do
    it { should belong_to(:country) }
    it { should belong_to(:sector) }
    it { should have_many(:investments) }
  end

  describe 'Validations' do
    it {
      expect(subject).to be_valid
    }
    it {
      should validate_numericality_of(:target_amount_in_cents)
        .is_greater_than(0)
    }
    it {
      should validate_numericality_of(:minimum_investment_in_cents)
        .is_greater_than(0)
    }
  end
end

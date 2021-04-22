# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Investment, type: :model do
  let(:campaign) { create(:campaign) }

  subject { create(:investment,campaign: campaign) }

  describe 'Associations' do
    it { should belong_to(:campaign) }
  end

  describe 'Validations' do
    it {
      expect(subject).to be_valid
    }
    it {
      should validate_numericality_of(:amount_in_cents)
        .is_greater_than(0)
    }
    it 'is not valid if the amount is not a multiple of the minimum campaign amount' do
      subject.amount_in_cents= 333
      expect(subject).not_to be_valid
      expect(subject.errors.messages).to have_key(:amount_in_cents)
    end
  end

  it 'updates the percentage of the campaign after its creation' do
    expect(subject.campaign.percentage_raised).to eq 0.1157e-4
  end
end

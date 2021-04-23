require 'rails_helper'

RSpec.describe CampaignSynchronizer::AttributeUpdater do
  let!(:campaign) { create(:campaign) }
  let!(:investment) { create(:investment, campaign: campaign) }
  describe '#initialize' do
    it 'initializes an instance of the class' do
      sut = CampaignSynchronizer::AttributeUpdater.new(campaign, [investment])
      expect(sut).to be_an_instance_of(CampaignSynchronizer::AttributeUpdater)
    end
  end
  describe '#update_attributes' do
    it 'it updates the attribute with the correct percentage based on the total investments' do
      sut = CampaignSynchronizer::AttributeUpdater.new(campaign, [investment, investment])
      expect(campaign.percentage_raised).to eq 0.1157e-4
      expect(sut.update_attributes).to eq true
      campaign.reload
      expect(campaign.percentage_raised).to eq 0.2314e-4
    end
  end
  describe '#calculate_percentage' do
    it 'returns the correct number rounded with 4 decimals when provided numerator and denominator' do
      sut = CampaignSynchronizer::AttributeUpdater .new(campaign, [investment])
      expect(sut.calculate_percentage(2, 3)).to eq 0.66667e0
    end

    it 'raises an error if denominator is equal to 0' do
      sut = CampaignSynchronizer::AttributeUpdater .new(campaign, [investment])
      expect { sut.calculate_percentage(2, 0) }.to raise_exception ZeroDivisionError
    end
  end
end

# frozen_string_literal: true

module CampaignSynchronizer
  class AttributeUpdater
    attr_reader :campaign, :investments
    def initialize(campaign, investments)
      @campaign = campaign
      @investments = investments
    end

    def update_attributes
      @investment_total = investments.sum(&:amount_in_cents)
      percentage = calculate_percentage(@investment_total, campaign.target_amount_in_cents)
      @campaign.update(percentage_raised: percentage)
    end

    def calculate_percentage(numerator, denominator)
      (numerator / denominator.to_r).to_d(5)
    end
  end
end

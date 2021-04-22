class Investment < ApplicationRecord
  belongs_to :campaign
  monetize :amount_in_cents, with_model_currency: :currency

  validate :investment_is_multiple_of_campaign_minimum
  validates :amount_in_cents,
            presence: true,
            allow_blank: false,
            numericality: {
              greater_than: 0
            }
  after_create :update_campaign

  def update_campaign
    investments = Investment.where(campaign_id: campaign_id)
    CampaignSynchronizer::AttributeUpdater.new(campaign,investments).update_attributes
  end

  def investment_is_multiple_of_campaign_minimum
    if amount_in_cents % campaign.minimum_investment_in_cents != 0
      errors.add(:amount_in_cents, 'is not multiple of the campaign minimum')
    end
  end
end

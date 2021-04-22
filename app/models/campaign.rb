# frozen_string_literal: true

class Campaign < ApplicationRecord
  belongs_to :country
  belongs_to :sector
  has_many :investments
  validates :target_amount_in_cents,
            presence: true,
            allow_blank: false,
            numericality: {
              greater_than: 0
            }
  validates :minimum_investment_in_cents,
            presence: true,
            allow_blank: false,
            numericality: {
              greater_than: 0
            }

  monetize :target_amount_in_cents, with_model_currency: :currency
  monetize :minimum_investment_in_cents, with_model_currency: :currency
end

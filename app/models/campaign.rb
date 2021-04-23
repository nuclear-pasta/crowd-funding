# frozen_string_literal: true

class Campaign < ApplicationRecord
    include ActionView::Helpers

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

  scope :filter_by_country, -> (code) { joins(:country).where(countries: {code: code}) }

  scope :filter_by_sector, -> (code) { joins(:sector).where(sectors: {code: code}) }


  def percentage_raised_formatted
    number_to_percentage(percentage_raised*100)
  end
end

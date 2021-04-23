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

  scope :filer_by_country, lambda { |country_name|
    Campaign.joins(:country).where('countries.name = ? ', country_name.to_s)
  }

  scope :filter_by_sector, lambda { |sector_name|
  Campaign.joins(:country).where('sectors.name = ? ', sector_name.to_s)
}

  def percentage_raised_formatted
    number_to_percentage(percentage_raised*100)
  end
end

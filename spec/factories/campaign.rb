# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    country
    sector
    name { 'Crypterium' }
    image_source { 'shorturl.at/klmGK' }
    percentage_raised { 0 }
    target_amount_in_cents { 100_000_700 }
    minimum_investment_in_cents { 1157 }
  end
end

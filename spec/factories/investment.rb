# frozen_string_literal: true

FactoryBot.define do
  factory :investment do
    campaign
    amount_in_cents { '1157' }
  end
end

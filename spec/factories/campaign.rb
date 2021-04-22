FactoryBot.define do
    factory :campaign do
      country
      sector
      name {'Crypterium'}
      image_url {'shorturl.at/klmGK'}
      percentage_raised { 0 }
      target_amount_in_cents {100000700}
      investment_multiple_in_cents {1157}
    end
  end

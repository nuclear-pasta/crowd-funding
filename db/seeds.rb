# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c = Country.create(name: 'Great Britain', code: 'GB')
s = Sector.create(name: 'Crypto', code: 'CRPT')
camp = Campaign.create(name: 'Crypterium',
                       image_source: 'shorturl.at/klmGK',
                       percentage_raised: 0,
                       target_amount_in_cents: 100_000_700,
                       minimum_investment_in_cents: 1157,
                       country: c,
                       sector: s)

Investment.create(amount_in_cents: 1157, campaign: camp)

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Campaign.destroy_all
Country.destroy_all
Sector.destroy_all
Investment.destroy_all
c1 = Country.create(name: 'Great Britain', code: 'GB')
c2 = Country.create(name: 'France', code: 'FR')
c3 = Country.create(name: 'Italy', code: 'IT')
countries = [c1, c2, c3]
s1 = Sector.create(name: 'Crypto', code: 'CRPT')
s2 = Sector.create(name: 'Tech', code: 'TECH')
s3 = Sector.create(name: 'Magic', code: 'MAGIC')
sectors = [s1, s2, s3]

company_names = %w[board lavish
               flash
               pin
               thundering
               guess
               flawless
               oatmeal
               malicious
               wholesale
               knock
               low
               reaction
               dock
               wilderness
               detailed
               whimsical
               analyze
               materialistic
               stomach]
target_amounts = [100_000_700, 10_000_000, 10_000, 999, 4_556_565, 2_322_443, 54_464, 232_323, 245_232_434, 2_233_256, 232_323, 1_212_466, 7544]
minimum_amounts =[1111,2222,3333,4000,5000,6000,7000,9000,10000]
company_names.each do |cn|
  Campaign.create(name: cn,
                  image_source: 'shorturl.at/klmGK',
                  percentage_raised: 0,
                  target_amount_in_cents: target_amounts.sample,
                  minimum_investment_in_cents: minimum_amounts.sample,
                  country: countries.sample,
                  sector: sectors.sample)
end


Investment.create(amount_in_cents: 1157, campaign: Campaign.last)

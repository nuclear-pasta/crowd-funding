class Campaign < ApplicationRecord
    belongs_to :country
    belongs_to :sector
    has_many :investments
end

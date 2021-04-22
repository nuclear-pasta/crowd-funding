# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :campaigns, dependent: :nullify
end

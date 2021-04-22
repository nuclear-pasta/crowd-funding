# frozen_string_literal: true

class Sector < ApplicationRecord
  has_many :campaigns, dependent: :nullify
end

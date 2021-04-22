# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  subject { create(:country) }

  describe 'Associations' do
    it { should have_many(:campaigns) }
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end

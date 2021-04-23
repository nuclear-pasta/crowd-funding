# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/v1/campaigns', type: :request do
  let(:campaign) { create :campaign }

  describe 'GET show' do
    it 'matches the expected schema and responds with 200 ' do
      api_get(api_v1_campaign_path(campaign.id))
      expect(response.status).to eq(200)
      expect(response).to match_response_schema("campaign")
    end
    it 'responds with a 404 if the record is not found ' do
      api_get(api_v1_campaign_path('wrong_id'))
      expect(response.status).to eq(404)
    end
  end

  describe 'GET index' do
    it 'matches the expected schema and responds with 200 ' do
      api_get(api_v1_campaigns_path)
      expect(response.status).to eq(200)
      expect(response).to match_response_schema("campaigns")
    end
  end
end

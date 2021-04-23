# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/v1/campaigns', type: :request do
  let(:campaign) { create :campaign }
  let(:foreign_country) { create :country, name:"FRANCE", code: 'FRA' }
  let(:another_sector) { create :sector, name:"Unicorn Farm", code: 'UFA' }


  describe 'GET #show' do
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

  describe 'GET #index' do
    it 'matches the expected schema and responds with 200 ' do
      api_get(api_v1_campaigns_path)
      expect(response.status).to eq(200)
      expect(response).to match_response_schema("campaigns")
    end

    it 'returns the correct campaigns when provided a query param filter' do
      create :campaign
      second_campaign = create :campaign ,country: foreign_country, sector: another_sector
      api_get(api_v1_campaigns_path(country: 'FRA'))
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['campaigns'].size).to eq 1
    end

    it 'returns the correct campaigns when given multiple query param filters' do
      create :campaign
      second_campaign = create :campaign ,country: foreign_country, sector: another_sector
      api_get(api_v1_campaigns_path(country: 'FRA', sector: 'CRPT'))
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)['campaigns'].size).to eq 0
    end

  end
  describe 'POST #create_investment' do
  it 'responds with 404 when provided a wrong campaign id ' do
    payload = {investment: {
      amount_in_cents: 1157
    }}
    api_post(create_investment_api_v1_campaign_path('wrong_id'),payload: payload)
    expect(response.status).to eq(404)
  end
    it 'responds with 201 when provided correct payload' do
      payload = {investment: {
        amount_in_cents: 1157
      }}
      api_post(create_investment_api_v1_campaign_path(campaign),payload: payload)
      expect(response.status).to eq(201)
    end
    it 'responds with 400 and provides info on the error when payment is not multiple of minimum campaign' do
      payload = {investment: {
        amount_in_cents: 222
      }}
      api_post(create_investment_api_v1_campaign_path(campaign),payload: payload)
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)['error']).to eq 'Amount in cents is not multiple of the campaign minimum'
    end
  end
end

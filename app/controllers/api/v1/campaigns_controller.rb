# frozen_string_literal: true

module Api
  module V1
    class CampaignsController < Api::V1::BaseController
      before_action :set_campaign, only: %i[show]

      def index
        @campaigns = Campaign.all
        filtering_params(params).each do |key, value|
          @campaigns = @campaigns.public_send("filter_by_#{key}", value) if value.present?
        end
        render json: {
          campaigns: CampaignBlueprint.render_as_hash(@campaigns), status: :ok
        }
      end

      def show
        raise_not_found unless @campaign
        render json: {
          campaigns: CampaignBlueprint.render_as_hash(@campaign), status: :ok
        }
      end

      private

      def set_campaign
        @campaign = Campaign.includes([:country, :sector]).find(params[:id])
      end

      def filtering_params(params)
        params.slice(:country, :sector)
      end

    end
  end
end

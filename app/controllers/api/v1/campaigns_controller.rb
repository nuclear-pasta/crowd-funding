# frozen_string_literal: true

module Api
  module V1
    class CampaignsController < Api::V1::BaseController
      before_action :set_campaign, only: %i[show create_investment]
      skip_before_action :verify_authenticity_token


      def index
        @campaigns = Campaign.all
        filtering_params(params).each do |key, value|
          @campaigns = @campaigns.public_send("filter_by_#{key}", value) if value.present?
        end
        render json: {
          campaigns: CampaignBlueprint.render_as_hash(@campaigns)
        }, status: :ok
      end

      def show
        render json: {
          campaign: CampaignBlueprint.render_as_hash(@campaign)
        }, status: :ok
      end

      def create_investment
        investment = @campaign.investments.build
        investment.assign_attributes(investment_permitted_params)
        render investment.save ?  {json: {resource: investment}, status: :created} : {json: {error: investment.errors.full_messages.to_sentence}, status:  :bad_request}
      end

      private

      def investment_permitted_params
        params.require(:investment).permit(
          :amount_in_cents
        )
      end

      def set_campaign
        @campaign = Campaign.includes([:country, :sector]).find(params[:id])
        head :not_found unless @campaign
      end

      def filtering_params(params)
        params.slice(:country, :sector)
      end

    end
  end
end

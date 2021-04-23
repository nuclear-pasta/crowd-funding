class CampaignBlueprint < Blueprinter::Base
    fields :name, :image_source

    field(:target) do |campaign|
        campaign.target_amount.format
    end

    field(:minimum_investment) do |campaign|
        campaign.minimum_investment.format
    end

    field(:percentage_raised) do |campaign|
        campaign.percentage_raised_formatted
    end

    field(:sector) do |campaign|
        campaign.sector.name
    end

    field(:country) do |campaign|
        campaign.country.name
    end

end

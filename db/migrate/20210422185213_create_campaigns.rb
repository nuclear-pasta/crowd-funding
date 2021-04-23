# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.string :name
      t.string :image_source
      t.decimal :percentage_raised
      t.integer :target_amount_in_cents
      t.integer :minimum_investment_in_cents
      t.references :sector, type: :uuid
      t.references :country, type: :uuid
      t.timestamps
    end
  end
end

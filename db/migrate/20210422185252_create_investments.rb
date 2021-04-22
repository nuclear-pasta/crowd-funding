# frozen_string_literal: true

class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments, id: :uuid do |t|
      t.integer :amount_in_cents
      t.references :campaign, type: :uuid
      t.timestamps
    end
  end
end

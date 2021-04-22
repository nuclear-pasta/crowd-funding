# frozen_string_literal: true

class CreateSectors < ActiveRecord::Migration[6.0]
  def change
    create_table :sectors, id: :uuid do |t|
      t.string :name
      t.string :code
      t.timestamps
    end
  end
end

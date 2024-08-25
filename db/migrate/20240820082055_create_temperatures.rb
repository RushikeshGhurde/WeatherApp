# frozen_string_literal: true

class CreateTemperatures < ActiveRecord::Migration[7.1]
  def change
    create_table :temperatures do |t|
      t.references :city, null: false, foreign_key: true
      t.date :date
      t.float :temperature

      t.timestamps
    end
  end
end

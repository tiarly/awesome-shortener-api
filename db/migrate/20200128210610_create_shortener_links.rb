# frozen_string_literal: true

class CreateShortenerLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :shortener_links do |t|
      t.string :original_url, null: false
      t.string :token, null: false
      t.integer :click_count, default: 0

      t.timestamps
    end
  end
end

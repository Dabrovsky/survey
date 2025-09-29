# frozen_string_literal: true

class CreateSurveys < ActiveRecord::Migration[7.2]
  def change
    create_table :surveys do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.integer :age, null: false
      t.integer :height, null: false
      t.string  :gender, null: false
      t.string  :favorite_color, null: false
      t.timestamps
    end
  end
end

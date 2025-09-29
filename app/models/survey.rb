# frozen_string_literal: true

# == Schema Information
#
# Table name: surveys
#
#  id             :integer          not null, primary key
#  first_name     :string           not null
#  last_name      :string           not null
#  age            :integer          not null
#  height         :integer          not null
#  gender         :string           not null
#  favorite_color :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Survey < ApplicationRecord
  GENDERS = [
    MALE = "male",
    FEMALE = "female",
    OTHER = "other"
  ].freeze

  enum gender: { male: MALE, female: FEMALE, other: OTHER }

  with_options presence: true do
    validates :first_name, :last_name, :gender, :favorite_color
    validates :age, :height, numericality: { only_integer: true, greater_than: 0 }
  end

  normalizes :first_name, :last_name, with: -> { it.squish.capitalize }
end

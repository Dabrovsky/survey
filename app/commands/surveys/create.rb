# frozen_string_literal: true

module Surveys
  class Create < Command
    attribute :first_name, String
    attribute :last_name, String
    attribute :age, Integer
    attribute :height, Integer
    attribute :gender, String
    attribute :favorite_color, String

    def call
      return failure(entity) unless save!

      success(entity)
    end

    private

    def entity
      @entity ||= Survey.new(entity_params)
    end

    def save!
      entity.save
    end

    def entity_params
      { first_name:, last_name:, age:, height:, gender:, favorite_color: }
    end
  end
end

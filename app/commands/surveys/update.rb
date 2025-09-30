# frozen_string_literal: true

module Surveys
  class Update < Command
    attribute :survey_id, Integer
    attribute :first_name, String
    attribute :last_name, String
    attribute :age, Integer
    attribute :height, Integer
    attribute :gender, String
    attribute :favorite_color, String

    def call
      return failure(entity) unless update!

      success(entity)
    end

    private

    def entity
      @entity ||= Survey.find(survey_id)
    end

    def update!
      entity.update(entity_params)
    end

    def entity_params
      { first_name:, last_name:, age:, height:, gender:, favorite_color: }
    end
  end
end

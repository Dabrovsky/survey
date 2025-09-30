# frozen_string_literal: true

module Surveys
  class Destroy < Command
    attribute :survey_id, Integer

    def call
      return failure(entity) unless destroy!

      success(entity)
    end

    private

    def entity
      @entity ||= Survey.find(survey_id)
    end

    def destroy!
      entity.destroy
    end
  end
end

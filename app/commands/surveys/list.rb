# frozen_string_literal: true

# Extracting logic into commands at this stage isn’t necessary, especially for a task of this size.
# However, I wanted to point out that doing so is beneficial, as it makes future development easier
# and helps maintain a consistent approach to separating business logic.
#
# For example, if we want to implement additional filters in the future,
# we could do that easily inside the command instead of the controller or model.
module Surveys
  class List < Command
    attribute :sort_field, String, default: :created_at
    attribute :sort_type, String, default: :asc

    def call
      scope = Survey.all
      scope = scope
        .then { order_records(it) }

      success(scope)
    end

    private

    def order_records(scope)
      return scope if sort_field.blank?

      scope.order(sort_field => sort_type)
    end
  end
end

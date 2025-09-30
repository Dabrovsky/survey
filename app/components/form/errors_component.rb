# frozen_string_literal: true

module Form
  class ErrorsComponent < ViewComponent::Base
    DEFAULT_MESSAGE = I18n.t("errors.messages.default_message")

    attr_reader :entity, :message, :messages

    def initialize(entity: nil, message: nil)
      @entity = entity
      @message = message
      @messages = fetch_messages.flatten
    end

    private

    def fetch_messages
      return entity.errors.full_messages.uniq if entity&.errors&.any?
      return [message] if message.present?

      [DEFAULT_MESSAGE]
    end
  end
end

# frozen_string_literal: true

module Messageable
  extend ActiveSupport::Concern

  private

  def succeed_message(message = I18n.t("entity.succeed_message"))
    build_message(message, "success")
  end

  def failed_message(message = I18n.t("entity.failed_message"))
    build_message(message, "failed")
  end

  def build_message(message, type)
    {
      flash: {
        alert: {
          message:,
          type:
        }
      }
    }.with_indifferent_access
  end
end

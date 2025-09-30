# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  attr_reader :flash

  def initialize(flash:)
    @flash = flash
  end

  private

  def any?
    flash.any?
  end

  def failed?
    %w(failed error).include?(type)
  end

  def type
    @type ||= flash["alert"]["type"]
  end

  def message
    @message ||= flash["alert"]["message"]
  end
end

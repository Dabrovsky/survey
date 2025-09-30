# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  include ColorVariants

  attr_reader :title, :type, :color, :data

  def initialize(title, color:, type: :button, data: {})
    @title = title
    @type = type
    @color = color
    @data = data
  end

  private

  def classes
    "py-2 px-4 inline-flex items-center gap-x-2 text-xs font-medium rounded border border-transparent cursor-pointer #{COLOR_VARIANTS[color]}"
  end
end

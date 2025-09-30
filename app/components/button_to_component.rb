# frozen_string_literal: true

class ButtonToComponent < ViewComponent::Base
  include ColorVariants

  attr_reader :title, :path, :method, :color, :data

  def initialize(title, path, color:, method: :delete, data: {})
    @title = title
    @path = path
    @method = method
    @color = color
    @data = data
  end

  private

  def classes
    "py-2 px-4 inline-flex items-center gap-x-2 text-xs font-medium rounded border border-transparent cursor-pointer #{COLOR_VARIANTS[color]}"
  end
end

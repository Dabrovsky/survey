# frozen_string_literal: true

class LinkToComponent < ViewComponent::Base
  include ColorVariants

  attr_reader :title, :path, :custom_css, :color, :data

  def initialize(title, path, custom_css: nil, color: nil, data: {})
    @title = title
    @path = path
    @custom_css = custom_css
    @color = color
    @data = data
  end

  private

  def classes
    return custom_css if custom_css.present?

    "py-2 px-4 inline-flex items-center gap-x-2 text-xs font-medium rounded border border-transparent cursor-pointer #{COLOR_VARIANTS[color]}"
  end
end

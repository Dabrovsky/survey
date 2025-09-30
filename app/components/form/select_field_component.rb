# frozen_string_literal: true

module Form
  class SelectFieldComponent < ViewComponent::Base
    attr_reader :form, :key, :title, :choices

    def initialize(form:, key:, title:, choices:)
      @form = form
      @key = key
      @title = title
      @choices = choices
    end
  end
end

# frozen_string_literal: true

module Form
  class NumberFieldComponent < ViewComponent::Base
    attr_reader :form, :key, :title

    def initialize(form:, key:, title:)
      @form = form
      @key = key
      @title = title
    end
  end
end

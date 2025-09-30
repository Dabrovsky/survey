# frozen_string_literal: true

module SurveysHelper
  def options_for_select
    Survey.genders.keys.map { [t("survey.genders.#{it}"), it] }
  end
end

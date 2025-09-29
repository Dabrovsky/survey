# frozen_string_literal: true

class SurveysController < ApplicationController
  before_action :set_survey, only: %i(show edit update destroy)

  def index
    @surveys = fetch_surveys
  end

  def show; end

  def new
    @survey = Survey.new
    render partial: "modal", locals: { survey: @survey }, layout: "modal"
  end

  def edit
    render partial: "modal", locals: { survey: @survey }, layout: "modal"
  end

  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      redirect_to surveys_path, succeed_message
    else
      render failed_response(@survey), status: :unprocessable_entity
    end
  end

  def update
    if @survey.update(survey_params)
      redirect_to surveys_path, succeed_message
    else
      render failed_response(@survey), status: :unprocessable_entity
    end
  end

  def destroy
    if @survey.destroy
      redirect_to surveys_path, succeed_message
    else
      redirect_to surveys_path, failed_message
    end
  end

  def entries
    surveys = fetch_surveys

    render turbo_stream: turbo_stream.replace(
      "survey_entries", partial: "surveys/surveys", locals: { surveys: }
    )
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def fetch_surveys
    Survey.all
  end

  def survey_params
    params.require(:survey).permit(:first_name, :last_name, :age, :height, :gender, :favorite_color)
  end

  def failed_response(survey)
    { turbo_stream: turbo_stream.replace("form", partial: "surveys/form", locals: { survey: }) }
  end
end

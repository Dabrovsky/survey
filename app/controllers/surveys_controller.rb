# frozen_string_literal: true

class SurveysController < ApplicationController
  before_action :set_survey, only: %i(show edit destroy)

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
    command = Surveys::Create.call(**survey_params)

    if command.success?
      redirect_to surveys_path, succeed_message
    else
      render failed_response(command.value), status: :unprocessable_entity
    end
  end

  def update
    command = Surveys::Update.call(survey_id:, **survey_params)

    if command.success?
      redirect_to surveys_path, succeed_message
    else
      render failed_response(command.value), status: :unprocessable_entity
    end
  end

  def destroy
    command = Surveys::Destroy.call(survey_id:)

    if command.success?
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

  def survey_id
    params[:id]
  end

  def set_survey
    @survey = Survey.find(survey_id)
  end

  def fetch_surveys
    Surveys::List.call.value
  end

  def survey_params
    params.require(:survey).permit(:first_name, :last_name, :age, :height, :gender, :favorite_color)
  end

  def failed_response(survey)
    { turbo_stream: turbo_stream.replace("form", partial: "surveys/form", locals: { survey: }) }
  end
end

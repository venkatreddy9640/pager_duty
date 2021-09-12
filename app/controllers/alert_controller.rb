class AlertController < ApplicationController

  def receive_alert
    team_id = params[:team_id]

    PagerDuty::UseCases::UseCase.receive_alert(team_id)

    render json: {}, status: :ok

  rescue PagerDuty::Exceptions::InvalidTeamError => e

    response = {
      message: "invalid_team_id #{e.team_id}"
    }

    render json: response, status: :unprocessable_entity
  end
end

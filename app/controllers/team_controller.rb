class TeamController < ApplicationController

  def create_team
    team_name = params[:name]

    developers = params[:developers]

    team_request = PagerDuty::UseCases::Entities::TeamRequest.new(
      name = team_name,
      developers = developers
    )

    PagerDuty::UseCases::UseCase.create_team(team_request)

    render json: {}, status: :ok
  end
end

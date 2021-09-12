module PagerDuty::UseCases::UseCase
  extend self

  def create_team(team_request)
    team = team_repo.create(team_request.name)

    developer_repo.create(team.id, team_request.developers)
  end

  def receive_alert(team_id)
    team = team_repo.get(team_id)

    raise PagerDuty::Exceptions::InvalidTeamError.new(team_id) if team.blank?

    developer = developer_repo.get_by_team(team_id)
    trigger_notif(developer)
  end

  private

  def team_repo
    PagerDuty::Repo::UseCases::TeamRepo
  end

  def developer_repo
    PagerDuty::Repo::UseCases::DeveloperRepo
  end

  def trigger_notif(developer)
    PagerDuty::UseCases::Internal::SendNotification.invoke(developer)
  end
end

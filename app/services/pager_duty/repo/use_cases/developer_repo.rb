module PagerDuty::Repo::UseCases
  module DeveloperRepo

    extend self

    def create(team_id, developers)
      developers.each do  |developer|
        model.create!(
          name: developer[:name],
          email: developer[:email],
          mobile: developer[:mobile],

          team_id: team_id
        )
      end
    end

    def get_by_team(team_id)
      model.find_by(team_id: team_id)
    end

    private

    def model
      PagerDuty::Repo::Models::Developer
    end
  end
end

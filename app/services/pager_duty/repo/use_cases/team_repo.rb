module PagerDuty::Repo::UseCases
  module TeamRepo

    extend self

    def create(name)
      model.create!(
        name: name
      )
    end

    def get(team_id)
      model.find_by(id: team_id)
    end

    private

    def model
      PagerDuty::Repo::Models::Team
    end
  end
end

module PagerDuty::Exceptions
  class InvalidTeamError < StandardError

    attr_accessor :team_id

    def initialize(team_id)
      super
      @team_id = team_id
    end
  end
end

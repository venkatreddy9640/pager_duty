module PagerDuty::Entities
  class Developer

    attr_accessor :name, :email, :mobile, :team_id


    def initialize(name, email, team_id)
      @name = name
      @email = email
      @mobile = mobile
      @team_id = team_id
    end
  end
end

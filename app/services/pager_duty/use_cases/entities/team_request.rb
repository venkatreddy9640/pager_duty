module PagerDuty::UseCases::Entities
  class TeamRequest

    attr_accessor :name, :developers

    def initialize(name, developers)
      @name = name
      @developers = developers
    end
  end
end

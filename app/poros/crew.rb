class Crew
  attr_reader :name,
              :job

  def initialize(crew_member)
    @name = crew_member[:name]
    @job = crew_member[:job]
  end
end

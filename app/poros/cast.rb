class Cast
  attr_reader :name,
              :character

  def initialize(cast_member)
    @name = cast_member[:name]
    @character = cast_member[:character]
  end
end

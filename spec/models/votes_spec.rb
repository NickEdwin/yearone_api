require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it { should validate_presence_of :movie_title }
  end
end

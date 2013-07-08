require 'TeamCityBuildFinder'

describe TeamCityBuildFinder::Environment do

  environment = TeamCityBuildFinder::Environment.new

  describe 'get_value' do
    it 'should return value when set in ENV' do
      ENV['my_key'] = '1'

      environment.get_value('my_key').should eql('1')
    end
  end

end
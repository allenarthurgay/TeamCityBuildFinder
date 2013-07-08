require 'TeamCityBuildFinder'
require_relative 'mock_json_request'


describe TeamCityBuildFinder::BuildRepository do

  options = {
      :json_request => MockJsonRequest.new
  }

  buildRepository = TeamCityBuildFinder::BuildRepository.new(options)

  describe 'get_builds_for_branch' do

    it 'should return a hash with a build field that is an array' do
      builds = buildRepository.get_builds_for_branch('some name that does not matter')
      builds['build'].kind_of?(Array).should eql(true)
    end

  end


  describe 'get_uri_to_teamcity_branch' do

    it 'should return the correct url with branch name' do
      tc_url = buildRepository.get_uri_to_teamcity_branch('branch')

      tc_url.should eql('http://teamcity.hq.daptiv.com/httpAuth/app/rest/builds?locator=branch:branch')
    end
  end


end

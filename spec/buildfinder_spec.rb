require 'TeamCityBuildFinder'
require_relative 'mock_json_request'

describe TeamCityBuildFinder::BuildFinder do

  buildRepoOptions = {
      :json_request => MockJsonRequest.new
  }
  options = {
      :build_repository=> TeamCityBuildFinder::BuildRepository.new(buildRepoOptions)
  }
  buildFinder = TeamCityBuildFinder::BuildFinder.new(options)

  describe 'findBuilds' do

    it 'should find 2 builds for build type 19' do
      builds = buildFinder.findBuilds('19', 'master')
      builds.length.should eql(2)
    end

    it 'should find 1 build for build type 18' do
      builds = buildFinder.findBuilds('18', 'master')
      builds.length.should eql(1)
    end
  end

  describe 'getLatestBuild' do

    it 'should get build with id of 3' do
      builds = buildFinder.getLatestBuild('19', 'master')
      builds.length.should eql(3)
    end

  end
end
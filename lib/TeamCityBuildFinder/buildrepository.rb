require 'json'
require_relative 'environment'
require_relative 'json_request'

module TeamCityBuildFinder

  class BuildRepository

    TC_API_PATH = '/httpAuth/app/rest/builds?locator=status:SUCCESS,branch:'

    def initialize(options = {})
      @environment = options[:environment] ? options[:environment] : TeamCityBuildFinder::Environment.new
      @username = options[:tc_username] ? options[:tc_username] : @environment.get_value('TC_USERNAME')
      @password = options[:tc_password] ? options[:tc_password] : @environment.get_value('TC_PASSWORD')
      @base_url = options[:tc_url] ? options[:tc_url] : @environment.get_value('TC_BASE_URL')
      @json_request = options[:json_request] ? options[:json_request] : TeamCityBuildFinder::JsonRequest.new(@username, @password)
    end

    def get_builds_for_branch(branch_name)
      url = get_uri_to_teamcity_branch(branch_name)
      jsonResponse = @json_request.get(url)
      return JSON.parse(jsonResponse)
    end

    def get_uri_to_teamcity_branch(branch_name)
      return "#{@base_url}#{TC_API_PATH}#{branch_name}"
    end

  end
end
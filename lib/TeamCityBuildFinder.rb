require_relative '../bin/trollop'
require_relative 'TeamCityBuildFinder/version'
require_relative 'TeamCityBuildFinder/buildfinder'

module TeamCityBuildFinder
  # Your code goes here...
  opts = Trollop::options do
    opt :find_build
    opt :tc_username, "Teamcity username", :type => :string
    opt :tc_password, "Teamcity password", :type => :string
    opt :tc_url, "Teamcity base url: e.q. http://teamcity/", :type => :string
    opt :build_type_id, "Teamcity build type", :type => :string
    opt :branch_name, "Teamcity branch name", :type => :string, :default => ""
  end

  if (opts[:find_build])
    buildFinder = TeamCityBuildFinder::BuildFinder.new(opts)
    build = buildFinder.getLatestBuild(opts[:build_type_id], opts[:branch_name])

    puts build["number"]
  end
end

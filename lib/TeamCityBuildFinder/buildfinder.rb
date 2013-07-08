require_relative 'buildrepository'

module TeamCityBuildFinder
  class BuildFinder

    def initialize(options = {})
      @repository = options[:build_repository] ? options[:build_repository] : TeamCityBuildFinder::BuildRepository.new(options)
    end

    def findBuilds(buildType, branch_name)
      builds = @repository.get_builds_for_branch(branch_name)

      found = builds["build"].select do |build|
        build["buildTypeId"] == buildType
      end

      sortedByAscendingId = found.sort do |buildx, buildy|
        buildy['id'] <=> buildx['id']
      end

      return sortedByAscendingId
    end

    def getLatestBuild(buildType, branch_name)
      builds = findBuilds(buildType, branch_name)
      return builds[0]
    end

  end

end
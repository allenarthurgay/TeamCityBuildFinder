module TeamCityBuildFinder
  class Environment
    def initialize

    end

    def get_value(name)
      if (ENV.has_key? name) && (!ENV[name].nil?)
        return ENV[name]
      else
        raise "Environment variable [#{name}] is not set"
      end
    end
  end
end

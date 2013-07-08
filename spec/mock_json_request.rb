require 'json'

class MockJsonRequest
  def initialize

  end

  def get(url)
    builds = {
        :build => [
            {
                :id => '1',
                :buildTypeId => '18',
                :name => 'build1'
            },
            {
                :id => '2',
                :buildTypeId => '19',
                :name => 'build2'
            },
            {
                :id => '3',
                :buildTypeId => '19',
                :name => 'build3'
            }
        ]
    }
    return builds.to_json
  end
end
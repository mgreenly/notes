require 'pp'
require 'byebug'

resources = Array.new(100) { rand(1..10) }
agents = Array.new(10) { 0 }

loop do
  resources = resources.select { |res| res > 0 }

  puts resources.sum

  # make claims
  claims = Hash.new { [] }
  agents.each_with_index do |value, index|
    pool = rand(0..(resources.count - 1))
    claims[pool] = claims[pool] << index
  end

  # resolve claims
  claims.each do |key, val|
    if resources[key] >= val.count
      resources[key] = resources[key] - val.count
      val.each do |agent|
        agents[agent] += 1
      end
    end
  end
  # byebug

  break if resources.sum < agents.count
end


pp resources
pp agents

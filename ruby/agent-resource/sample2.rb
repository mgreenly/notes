require 'pp'
require 'byebug'

resources = Array.new(100) { rand(1..10) }
agents = Array.new(10) { 0 }

loop do
  break if resources.sum == 0
  resources = resources.select { |value| value > 0 }

  # create the claims
  claims = Hash.new { [] }
  agents.count.times do |agent_index|
    resource_index = rand(0..(resources.count - 1))
    claims[resource_index] = claims[resource_index] << agent_index
  end

  # resolve the claims
  claims.each do |resource_index, agent_indexes|
    agent_indexes.shuffle.each do |agent_index|
      break if resources[resource_index] == 0
      resources[resource_index] -= 1
      agents[agent_index] += 1
    end
  end

  print '.'
end

puts

pp agents
puts agents.sum

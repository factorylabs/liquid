# encoding: UTF-8

version = ARGV.pop

puts "Building liquid v#{version}"
`gem build liquid.gemspec`

puts "Pushing liquid v#{version}"
`gem push liquid-#{version}.gem`

puts "Deleting the gem file..."
`rm liquid-#{version}.gem`

puts "DONE!"
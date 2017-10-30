# Starting Time
START_TIME = Time.now

# Get Information, Log In, and Bench Players
require_relative 'requirements'

# Shutdown Procedure
sleep(1)
puts " "
sleep(1)
puts "Success! All your players that could be benched are on the bench now!"
sleep(1)
puts "This script took #{(Time.now - START_TIME).to_i} seconds to complete!"
sleep(1)
puts "Goodbye!"
sleep(1)
@browser.close
